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

from .factory import setup_module

sys.path.insert(0, '~/yangrun/project/graph_diffusion_autoencoder')
import math
import dgl
import dgl.function as fn
from utils.utils import make_edge_weights
from .mlp_gat import Denoising_Unet
from dgl import SIGNDiffusion


def extract(v, t, x_shape):
    """
    Extract some coefficients at specified timesteps, then reshape to
    [batch_size, 1, 1, 1, 1, ...] for broadcasting purposes.
    """
    out = torch.gather(v, index=t, dim=0).float()
    return out.view([t.shape[0]] + [1] * (len(x_shape) - 1))


class ModelNode(nn.Module):
    def __init__(
            self,
            in_dim: int,
            num_hidden: int,
            num_layers: int,
            nhead: int,
            nhead_out: int,
            activation: str,
            feat_drop: float,
            attn_drop: float,
            negative_slope: float,
            residual: bool,
            norm: Optional[str],
            mask_rate: float = 0.3,
            encoder_type: str = "gat",
            decoder_type: str = "gat",
            loss_fn: str = "sce",
            alpha_l: float = 2,
            concat_hidden: bool = False,
            beta_1: float = 0.0001,
            beta_T: float = 0.02,
            T: int = 1000

         ):
        super(ModelNode, self).__init__()
        self.T = T
        self.register_buffer(
                'betas', torch.linspace(beta_1, beta_T, T).double()
                )
        alphas = 1. - self.betas
        alphas_bar = torch.cumprod(alphas, dim=0)

        self.register_buffer(
                'sqrt_alphas_bar', torch.sqrt(alphas_bar)
                )
        self.register_buffer(
                'sqrt_one_minus_alphas_bar', torch.sqrt(1. - alphas_bar)
                )
        self._mask_rate = mask_rate
        self._encoder_type = encoder_type
        self._decoder_type = decoder_type
        self._output_hidden_size = num_hidden
        self._concat_hidden = concat_hidden

        assert num_hidden % nhead == 0
        assert num_hidden % nhead_out == 0
        
        enc_num_hidden = num_hidden
        #enc_nhead = 1
        if encoder_type in ("gat", "dotgat"):
            enc_num_hidden = num_hidden // nhead
            enc_nhead = nhead
        else:
            enc_num_hidden = num_hidden
            enc_nhead = 1

        # dec_in_dim = num_hidden
        # dec_num_hidden = num_hidden // nhead_out if decoder_type in ("gat", "dotgat") else num_hidden
        
        # self.net = setup_module(
        #   m_type=encoder_type,
        #    enc_dec="encoding",
        #    in_dim=in_dim,
        #    num_hidden=enc_num_hidden,
        #    out_dim=in_dim,
        #    num_layers=num_layers,
        #    nhead=enc_nhead,
        #    nhead_out=enc_nhead,
        #    concat_out=True,
        #    activation=activation,
        #    dropout=feat_drop,
        #    attn_drop=attn_drop,
        #    negative_slope=negative_slope,
        #    residual=residual,
        #    norm=norm,
        # )
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


        # self.norm_x = nn.BatchNorm1d(in_dim)
        self.norm_x = nn.LayerNorm(in_dim, elementwise_affine=False)
        # if concat_hidden:
        #     self.encoder_to_decoder = nn.Linear(dec_in_dim * num_layers, dec_in_dim, bias=False)
        # else:
        #     self.encoder_to_decoder = nn.Linear(dec_in_dim, dec_in_dim, bias=False)
        self.time_embedding = nn.Embedding(T, num_hidden)
        self.label_embedding = nn.Embedding(10, num_hidden)
        self.noise_embedding = nn.Parameter(torch.ones((1, in_dim)))
        self.affine_w = nn.Parameter(torch.ones((1, in_dim)))
        self.affine_b = nn.Parameter(torch.zeros((1, in_dim)))
        # self.affine_b = nn.Parameter(torch.tensor(1).float())
        # self.time_embedding = TimeEmbedding(T, num_hidden, num_hidden)
        # self.edge_time_embedding = TimeEmbedding(T, num_hidden, num_hidden)
        self.link_pred = DotProductPredictor()
        self.bce = nn.BCELoss()

    def forward(self, g, x):
        with torch.no_grad():
            x = F.layer_norm(x, (x.shape[-1], ))

        t = torch.randint(self.T, size=(x.shape[0], ), device=x.device)
        x_t, time_embed, g, label_embed = self.sample_q(t, x, g)

        loss = self.node_denoising(x, x_t, time_embed, g, label_embed)
        loss_item = {"loss": loss.item()}
        return loss, loss_item

    def sample_q(self, t, x, g):
        miu, std = x.mean(dim=0), x.std(dim=0)
        noise = torch.randn_like(x, device=x.device)
        with torch.no_grad():
            noise = F.layer_norm(noise, (noise.shape[-1], ))
        # noise = self.norm_x(noise)
        noise = noise * std + miu
        noise = torch.sign(x) * torch.abs(noise)
        # g.ndata['noise'] = noise
        # transform = SIGNDiffusion(k=3, in_feat_name='noise', diffuse_op='gcn')
        # g = transform(g)
        # noise = g.ndata['out_feat_3']
        x_t = (
                extract(self.sqrt_alphas_bar, t, x.shape) * x +
                extract(self.sqrt_one_minus_alphas_bar, t, x.shape) * noise
                )
        time_embed = self.time_embedding(t)
        label_embed = None
        return x_t, time_embed, g, label_embed 

    def node_denoising(self, x, x_t, time_embed, g, label_embed):
        out, _ = self.net(g, x_0=x, x_t=x_t, time_embed=time_embed, label_embed=label_embed)
        # loss = F.mse_loss(out, g.ndata['noise'], reduction='mean')
        loss = sce_loss(out, x)
        # loss = sce_loss(out, g.ndata['noise'])
        # loss = F.mse_loss(out, g.ndata['out_feat_4'], reduction='mean')
        # loss = F.mse_loss(out, x, reduction='mean')
        return loss

    def embed(self, g, x, T):
        t = torch.full((1, ), T, device=x.device)
        with torch.no_grad():
            x = F.layer_norm(x, (x.shape[-1], ))
        x_t, time_embed, g, label_embed = self.sample_q(t, x, g)
        _, hidden = self.net(g, x_0=x, x_t=x_t, time_embed=time_embed, label_embed=label_embed)
        # hidden, _ = self.net(g, x_0=x, x_t=x_t, time_embed=time_embed, label_embed=label_embed)
        return hidden


class TimeEmbedding(nn.Module):
    def __init__(self, T, d_model, dim):
        assert d_model % 2 == 0
        super().__init__()
        emb = torch.arange(0, d_model, step=2) / d_model * math.log(10000)
        emb = torch.exp(-emb)
        pos = torch.arange(T).float()
        emb = pos[:, None] * emb[None, :]
        assert list(emb.shape) == [T, d_model // 2]
        emb = torch.stack([torch.sin(emb), torch.cos(emb)], dim=-1)
        assert list(emb.shape) == [T, d_model // 2, 2]
        emb = emb.view(T, d_model)

        self.timembedding = nn.Sequential(
            nn.Embedding.from_pretrained(emb),
            nn.Linear(d_model, dim),
            Swish(),
            nn.Linear(dim, dim),
        )
        self.initialize()

    def initialize(self):
        for module in self.modules():
            if isinstance(module, nn.Linear):
                init.xavier_uniform_(module.weight)
                init.zeros_(module.bias)

    def forward(self, t):
        emb = self.timembedding(t)
        return emb


class Swish(nn.Module):
    def forward(self, x):
        return x * torch.sigmoid(x)


class DotProductPredictor(nn.Module):
    def forward(self, graph, h):
        with graph.local_scope():
            graph.ndata['h'] = F.normalize(h, p=2, dim=-1)
            graph.apply_edges(fn.u_dot_v('h', 'h', 'score'))
            # score = edge_softmax(graph, graph.edata['score']) 
            return graph.edata['score']
            # return score


def sce_loss(x, y, alpha=2):
    x = F.normalize(x, p=2, dim=-1)
    y = F.normalize(y, p=2, dim=-1)

    # loss =  - (x * y).sum(dim=-1)
    # loss = (x_h - y_h).norm(dim=1).pow(alpha)

    loss = (1 - (x * y).sum(dim=-1)).pow_(alpha)

    loss = loss.mean()
    return loss
