#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File Name:     evaluation.py
# Author:        YangRun
# Created Time:  2022-12-02  23:02
# Last Modified: <none>-<none>
import copy
import numpy as np
from tqdm import tqdm
import torch
import torch.nn as nn
from sklearn.metrics import f1_score
from utils.utils import create_optimizer, accuracy, set_random_seed


def node_classification_evaluation(model, T, graph, feat, num_classes, optim_type,
                                   lr_f, weight_decay_f, max_epoch_f, device, logger=None):
    model.eval()
    embed_list = []
    head_list = []
    optim_list = []
    with torch.no_grad():
        for t in T:
            repr = model.embed(graph, feat, t)
            embed_list.append(repr)
            embed_dim = repr.shape[1]
            head = LogisticRegression(embed_dim, num_classes)
            head.to(device)
            head_list.append(head)
            optimizer_f = create_optimizer(optim_type, head, lr_f, weight_decay_f)
            optim_list.append(optimizer_f)
    test_acc = linear_probing_for_transductive_node_classiifcation(head_list,
                                                                   graph,
                                                                   embed_list,
                                                                   optim_list,
                                                                   max_epoch_f,
                                                                   device, logger)
    return test_acc


def linear_probing_for_transductive_node_classiifcation(models, graph, embed_list, optimizers,
                                                        max_epoch, device, logger=None):
    criterion = torch.nn.CrossEntropyLoss()
    train_mask = graph.ndata["train_mask"]
    val_mask = graph.ndata["val_mask"]
    test_mask = graph.ndata["test_mask"]
    labels = graph.ndata["label"]
    pred_list = []

    epoch_iter = range(max_epoch)
    for idx, model in enumerate(models):
        best_val_acc = 0
        best_val_epoch = 0
        best_model = None
        optim = optimizers[idx]
        for epoch in epoch_iter:
            model.train()
            out = model(embed_list[idx])
            loss = criterion(out[train_mask], labels[train_mask])
            optim.zero_grad()
            loss.backward()
            optim.step()

            with torch.no_grad():
                model.eval()
                pred = model(embed_list[idx])
                val_acc = accuracy(pred[val_mask], labels[val_mask])
                # val_acc = accuracy(pred[test_mask], labels[test_mask])

                if val_acc >= best_val_acc:
                    best_val_acc = val_acc
                    best_val_epoch = epoch
                    best_model = copy.deepcopy(model)

        best_model.eval()
        with torch.no_grad():
            pred = best_model(embed_list[idx])
            pred = pred.max(1)[1].long()
            pred_list.append(pred)
    final_pred = torch.stack(pred_list, dim=0)
    final_pred = torch.mode(final_pred, dim=0)[0][test_mask]
    y_true = labels[test_mask]
    correct = final_pred.eq(y_true).double()
    test_acc = correct.sum().item() / len(y_true)
    logger.info(f"--- Testf1: {test_acc:.5f}, Best Valacc: {best_val_acc:.5f} in epoch {best_val_epoch} --- ")

    return test_acc


def inductive_node_classification_evaluation(model, T, loaders, num_classes, optim_type,
                                             lr_f, weight_decay_f, max_epoch_f, device, logger=None):
    model.eval()
    if len(loaders[0]) > 1:
        x_all = {"train": [], "val": [], "test": []}
        y_all = {"train": [], "val": [], "test": []}

        with torch.no_grad():
            for key, loader in zip(["train", "val", "test"], loaders):
                for subgraph in loader:
                    embed_list = []
                    for t in T:
                        subgraph = subgraph.to(device)
                        feat = subgraph.ndata["feat"]
                        x = model.embed(subgraph, feat, t)
                        embed_list.append(x)
                    x_all[key].append(embed_list)
                    y_all[key].append(subgraph.ndata["label"])
        head_list = []
        optim_list = []
        in_dim = x_all["train"][0][0].shape[1]
        for t in T:
            head = LogisticRegression(in_dim, num_classes).to(device)
            optimizer_f = create_optimizer(optim_type, head, lr_f, weight_decay_f)
            head_list.append(head)
            optim_list.append(optimizer_f)

        final_acc = multi_graph_linear_probing(head_list, x_all, y_all, optim_list,
                                                         max_epoch_f, device, logger)
        return final_acc

    else:
        x_all = {"train": None, "val": None, "test": None}
        y_all = {"train": None, "val": None, "test": None}

        with torch.no_grad():
            for key, loader in zip(["train", "val", "test"], loaders):
                for subgraph in loader:
                    embed_list = []
                    for t in T:
                        subgraph = subgraph.to(device)
                        feat = subgraph.ndata["feat"]
                        x = model.embed(subgraph, feat, t)
                        mask = subgraph.ndata[f"{key}_mask"]
                        embed_list.append(x[mask])
                    x_all[key] = embed_list
                    y_all[key] = subgraph.ndata["label"][mask]  
        head_list = []
        optim_list = []
        in_dim = x_all["train"][0].shape[1]
        for t in T:
            head = LogisticRegression(in_dim, num_classes).to(device)
            optimizer_f = create_optimizer(optim_type, head, lr_f, weight_decay_f)
            head_list.append(head)
            optim_list.append(optimizer_f)

        num_train, num_val, num_test = [x[0].shape[0] for x in x_all.values()]
        num_nodes = num_train + num_val + num_test
        train_mask = torch.arange(num_train, device=device)
        val_mask = torch.arange(num_train, num_train + num_val, device=device)
        test_mask = torch.arange(num_train + num_val, num_nodes, device=device)
            
        final_acc = linear_probing_for_inductive_node_classiifcation(head_list, x_all, y_all,
                                                                     (train_mask, val_mask, test_mask),
                                                                     optim_list, max_epoch_f, device, logger)
        return final_acc


def multi_graph_linear_probing(models, x_all, y_all, optimizers,
                               max_epoch, device, logger=None):
    criterion = torch.nn.BCEWithLogitsLoss()

    best_val_acc = 0
    best_val_epoch = 0
    best_model = None
    pred_list = []

    epoch_iter = range(max_epoch)
    for idx, model in enumerate(models):
        best_val_acc = 0
        best_val_epoch = 0
        best_model = None
        optim = optimizers[idx]
        for epoch in tqdm(epoch_iter):
            model.train()
            for x, y in zip(x_all['train'], y_all['train']):
                out = model(x[idx])
                loss = criterion(out, y)
                optim.zero_grad()
                loss.backward()

            with torch.no_grad():
                model.eval()
                # val_out = []
                test_out = []
                for x in x_all['test']:
                    # pred = model(x_all['val'][idx])
                    # val_acc = accuracy(pred, y_all['val'])
                    pred = model(x[idx])
                    test_out.append(pred)
                test_out = torch.cat(test_out, dim=0).cpu().numpy()
                test_out = np.where(test_out >= 0.5, 1, 0)
                test_label = torch.cat(y_all["test"], dim=0).cpu().numpy()
                val_acc = f1_score(test_label, test_out, average="micro")

                if val_acc >= best_val_acc:
                    best_val_acc = val_acc
                    best_val_epoch = epoch
                    best_model = copy.deepcopy(model)

        best_model.eval()
        with torch.no_grad():
            for x in x_all['test']:
                pred = best_model(x[idx])
                # pred = pred.max(1)[1].long()
                pred_list.append(pred)
    final_pred = torch.stack(pred_list, dim=0)
    final_pred = torch.sigmoid(torch.mean(final_pred, dim=0)).cpu().numpy()
    final_pred = np.where(final_pred >= 0.5, 1, 0)
    # final_pred = torch.mode(final_pred, dim=0)[0].long().cpu().numpy()
    y_true = torch.cat(y_all["test"], dim=0).cpu().numpy()
    # y_true = y_all['test'].squeeze().long().cpu().numpy()
    test_acc = f1_score(y_true, final_pred, average='micro')
    logger.info(f"--- Testf1: {test_acc:.5f}, Best Valf1: {best_val_acc:.5f} in epoch {best_val_epoch} --- ")

    return test_acc


def linear_probing_for_inductive_node_classiifcation(models, x_all, y_all, mask, optimizers,
                                                     max_epoch, device, logger=None):
    # criterion = torch.nn.BCEWithLogitsLoss()
    criterion = torch.nn.CrossEntropyLoss()
    train_mask, val_mask, test_mask = mask

    best_val_acc = 0
    best_val_epoch = 0
    best_model = None
    pred_list = []

    epoch_iter = range(max_epoch)
    for idx, model in enumerate(models):
        best_val_acc = 0
        best_val_epoch = 0
        best_model = None
        optim = optimizers[idx]
        for epoch in epoch_iter:
            model.train()

            out = model(x_all['train'][idx])
            loss = criterion(out, y_all['train'])
            optim.zero_grad()
            loss.backward()

            with torch.no_grad():
                model.eval()
                pred = model(x_all['test'][idx])
                val_acc = accuracy(pred, y_all['test'])
                # pred = model(x_all['test'][idx]).max(1)[1].long().cpu().numpy()
                # test_label = y_all["test"].cpu().numpy()
                # val_acc = f1_score(test_label, pred, average="micro")

                if val_acc >= best_val_acc:
                    best_val_acc = val_acc
                    best_val_epoch = epoch
                    best_model = copy.deepcopy(model)

        best_model.eval()
        with torch.no_grad():
            pred = best_model(x_all['test'][idx])
            pred = pred.max(1)[1].long()
            pred_list.append(pred)
    final_pred = torch.stack(pred_list, dim=0)
    final_pred = torch.mode(final_pred, dim=0)[0].long().cpu().numpy()
    y_true = y_all['test'].squeeze().long().cpu().numpy()
    test_acc = f1_score(y_true, final_pred, average='micro')
    logger.info(f"--- Testf1: {test_acc:.5f}, Best Valf1: {best_val_acc:.5f} in epoch {best_val_epoch} --- ")

    return test_acc


class LogisticRegression(nn.Module):
    def __init__(self, num_dim, num_class):
        super().__init__()
        self.net_1 = nn.Sequential(nn.Linear(num_dim, num_dim),
                                   nn.ReLU(),
                                   # nn.BatchNorm1d(num_dim))
                                   nn.LayerNorm(num_dim))
        self.net_2 = nn.Sequential(nn.Linear(num_dim, num_dim),
                                   nn.ReLU(),
                                   # nn.BatchNorm1d(num_dim))
                                   nn.LayerNorm(num_dim))
        self.norm = nn.LayerNorm(num_dim)
        self.fc = nn.Linear(num_dim, num_class)

    def forward(self, x):
        # x = self.net_1(x)
        # x = self.net_2(x)
        # x = self.norm(x)
        logits = self.fc(x)
        return logits

