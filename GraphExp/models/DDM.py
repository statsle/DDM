#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File Name:     diffusion.py
# Author:        Yang Run
# Created Time:  2022-10-29  17:09
# Last Modified: <none>-<none>

import sys
from typing import Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.nn import init

import math
import dgl
import dgl.function as fn
from utils.utils import make_edge_weights
from .mlp_gat import Denoising_Unet
import numpy as np


def extract(v, t, x_shape):
    """
    Extract some coefficients at specified timesteps, then reshape to
    [batch_size, 1, 1, 1, 1, ...] for broadcasting purposes.
    """
    out = torch.gather(v, index=t, dim=0).float()
    return out.view([t.shape[0]] + [1] * (len(x_shape) - 1))


class DDM(nn.Module):
    def __init__(
            self,
            in_dim: int,
            num_hidden: int,
            num_layers: int,
            nhead: int,
            activation: str,
            feat_drop: float,
            attn_drop: float,
            norm: Optional[str],
            alpha_l: float = 2,
            beta_schedule: str = 'linear',
            beta_1: float = 0.0001,
            beta_T: float = 0.02,
            T: int = 1000,
            **kwargs

         ):
        super(DDM, self).__init__()
        self.T = T
        beta = get_beta_schedule(beta_schedule, beta_1, beta_T, T)
        self.register_buffer(
                'betas', beta
                )
        alphas = 1. - self.betas
        alphas_bar = torch.cumprod(alphas, dim=0)

        self.register_buffer(
                'sqrt_alphas_bar', torch.sqrt(alphas_bar)
                )
        self.register_buffer(
                'sqrt_one_minus_alphas_bar', torch.sqrt(1. - alphas_bar)
                )

        self.alpha_l = alpha_l
        assert num_hidden % nhead == 0
        self.net = Denoising_Unet(in_dim=in_dim,
                                  num_hidden=num_hidden,
                                  out_dim=in_dim,
                                  num_layers=num_layers,
                                  nhead=nhead,
                                  activation=activation,
                                  feat_drop=feat_drop,
                                  attn_drop=attn_drop,
                                  negative_slope=0.2,
                                  norm=norm)

        self.time_embedding = nn.Embedding(T, num_hidden)

    def forward(self, g, x):
        with torch.no_grad():
            x = F.layer_norm(x, (x.shape[-1], ))

        t = torch.randint(self.T, size=(x.shape[0], ), device=x.device)
        x_t, time_embed, g, label_embed = self.sample_q(t, x, g)

        loss = self.node_denoising(x, x_t, time_embed, g)
        loss_item = {"loss": loss.item()}
        return loss, loss_item

    def sample_q(self, t, x, g):
        miu, std = x.mean(dim=0), x.std(dim=0)
        noise = torch.randn_like(x, device=x.device)
        with torch.no_grad():
            noise = F.layer_norm(noise, (noise.shape[-1], ))
        noise = noise * std + miu
        noise = torch.sign(x) * torch.abs(noise)
        x_t = (
                extract(self.sqrt_alphas_bar, t, x.shape) * x +
                extract(self.sqrt_one_minus_alphas_bar, t, x.shape) * noise
                )
        time_embed = self.time_embedding(t)
        return x_t, time_embed, g

    def node_denoising(self, x, x_t, time_embed, g):
        out, _ = self.net(g, x_t=x_t, time_embed=time_embed)
        loss = sce_loss(out, x, self.alpha_l)

        return loss

    def embed(self, g, x, T):
        t = torch.full((1, ), T, device=x.device)
        with torch.no_grad():
            x = F.layer_norm(x, (x.shape[-1], ))
        x_t, time_embed, g = self.sample_q(t, x, g)
        _, hidden = self.net(g, x_t=x_t, time_embed=time_embed)
        return hidden


def loss_fn(x, y, alpha=2):
    x = F.normalize(x, p=2, dim=-1)
    y = F.normalize(y, p=2, dim=-1)

    loss = (1 - (x * y).sum(dim=-1)).pow_(alpha)

    loss = loss.mean()
    return loss


def get_beta_schedule(beta_schedule, beta_start, beta_end, num_diffusion_timesteps):
    def sigmoid(x):
        return 1 / (np.exp(-x) + 1)

    if beta_schedule == "quad":
        betas = (
            np.linspace(
                beta_start ** 0.5,
                beta_end ** 0.5,
                num_diffusion_timesteps,
                dtype=np.float64,
            )
            ** 2
        )
    elif beta_schedule == "linear":
        betas = np.linspace(
            beta_start, beta_end, num_diffusion_timesteps, dtype=np.float64
        )
    elif beta_schedule == "const":
        betas = beta_end * np.ones(num_diffusion_timesteps, dtype=np.float64)
    elif beta_schedule == "jsd":  # 1/T, 1/(T-1), 1/(T-2), ..., 1
        betas = 1.0 / np.linspace(
            num_diffusion_timesteps, 1, num_diffusion_timesteps, dtype=np.float64
        )
    elif beta_schedule == "sigmoid":
        betas = np.linspace(-6, 6, num_diffusion_timesteps)
        betas = sigmoid(betas) * (beta_end - beta_start) + beta_start
    else:
        raise NotImplementedError(beta_schedule)
    assert betas.shape == (num_diffusion_timesteps,)
    return torch.from_numpy(betas)
