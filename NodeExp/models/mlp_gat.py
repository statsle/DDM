#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File Name:     mlp_gat.py
# Author:        Run Yang
# Created Time:  2022-12-06  13:48
# Last Modified: <none>-<none>
import torch
import torch.nn as nn 
import torch.nn.functional as F

import dgl
from dgl.nn import GINConv
from dgl.nn import GATConv
from dgl.nn import EGATConv
import dgl.function as fn
from dgl.nn.functional import edge_softmax
from .utils import create_activation, create_norm


def exists(x):
    return x is not None


class Denoising_Unet(nn.Module):
    def __init__(self,
                 in_dim,
                 num_hidden,
                 out_dim,
                 num_layers,
                 nhead,
                 activation,
                 feat_drop,
                 attn_drop,
                 negative_slope,
                 norm,
                 ):
        super(Denoising_Unet, self).__init__()
        self.out_dim = out_dim
        self.num_heads = nhead
        self.num_layers = num_layers
        self.num_hidden = num_hidden
        self.down_layers = nn.ModuleList()
        self.up_layers = nn.ModuleList()
        self.activation = activation

        self.mlp_in_t = MlpBlock(in_dim=in_dim, hidden_dim=num_hidden*2, out_dim=num_hidden,
                                 norm=norm, activation=activation)

        self.mlp_middle = MlpBlock(num_hidden, num_hidden, num_hidden, norm=norm, activation=activation)

        self.mlp_out = MlpBlock(num_hidden, out_dim, out_dim, norm=norm, activation=activation)

        self.down_layers.append(GATConv(num_hidden, num_hidden // nhead, nhead, feat_drop, attn_drop, negative_slope))
        self.up_layers.append(GATConv(num_hidden, num_hidden, 1, feat_drop, attn_drop, negative_slope))


        for _ in range(1, num_layers):
            self.down_layers.append(GATConv(num_hidden, num_hidden // nhead, nhead, feat_drop,
                                            attn_drop, negative_slope))
            self.up_layers.append(GATConv(num_hidden, num_hidden // nhead, nhead, feat_drop,
                                          attn_drop, negative_slope))
        self.up_layers = self.up_layers[::-1]

    def forward(self, g, x_t, time_embed):
        h_t = self.mlp_in_t(x_t)
        down_hidden = []
        for l in range(self.num_layers):
            if h_t.ndim > 2:
                h_t = h_t + time_embed.unsqueeze(1).repeat(1, h_t.shape[1], 1)
            else:
                pass
            h_t = self.down_layers[l](g, h_t)
            h_t = h_t.flatten(1)
            down_hidden.append(h_t)
        h_middle = self.mlp_middle(h_t)

        h_t = h_middle
        out_hidden = []
        for l in range(self.num_layers):
            h_t = h_t + down_hidden[self.num_layers - l - 1 ]
            if h_t.ndim > 2:
                h_t = h_t + time_embed.unsqueeze(1).repeat(1, h_t.shape[1], 1)
            else:
                pass
            h_t = self.up_layers[l](g, h_t)
            h_t = h_t.flatten(1)
            out_hidden.append(h_t)
        out = self.mlp_out(h_t)
        out_hidden = torch.cat(out_hidden, dim=-1)

        return out, out_hidden


class Residual(nn.Module):
    def __init__(self, fnc):
        super().__init__()
        self.fnc = fnc

    def forward(self, x, *args, **kwargs):
        return self.fnc(x, *args, **kwargs) + x


class MlpBlock(nn.Module):
    def __init__(self, in_dim: int, hidden_dim: int, out_dim: int,
                 norm: str = 'layernorm', activation: str = 'prelu'):
        super(MlpBlock, self).__init__()
        self.in_proj = nn.Linear(in_dim, hidden_dim)
        self.res_mlp = Residual(nn.Sequential(nn.Linear(hidden_dim, hidden_dim),
                                              create_norm(norm)(hidden_dim),
                                              create_activation(activation),
                                              nn.Linear(hidden_dim, hidden_dim)))
        self.out_proj = nn.Linear(hidden_dim, out_dim)
        self.act = create_activation(activation)
    def forward(self, x):
        x = self.in_proj(x)
        x = self.res_mlp(x)
        x = self.out_proj(x)
        x = self.act(x)
        return x
        
