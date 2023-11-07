import numpy as np

import argparse

import shutil
import time
import os.path as osp

import dgl
from dgl.nn.pytorch.glob import SumPooling, AvgPooling, MaxPooling
from dgl.dataloading import GraphDataLoader
from dgl import RandomWalkPE

import torch
from torch.utils.data.sampler import SubsetRandomSampler
import torch.nn as nn
from dgl.nn.functional import edge_softmax

from sklearn.model_selection import StratifiedKFold, GridSearchCV
from sklearn.svm import SVC
from sklearn.metrics import f1_score

from utils.utils import (create_optimizer, create_pooler, set_random_seed, compute_ppr)

from datasets.data_util import load_graph_classification_dataset

from models import DDM

from config import config as cfg
import multiprocessing
from multiprocessing import Pool


from utils import comm
from utils.collect_env import collect_env_info
from utils.logger import setup_logger
from utils.misc import mkdir


def graph_classification_evaluation(model, T, pooler, dataloader, device, logger):
    model.eval()
    embed_list = []
    head_list = []
    optim_list = []
    with torch.no_grad():
        for t in T:
            x_list = []
            y_list = []
            for i, (batch_g, labels) in enumerate(dataloader):
                batch_g = batch_g.to(device)
                feat = batch_g.ndata["attr"]
                out = model.embed(batch_g, feat, t)
                out = pooler(batch_g, out)
                y_list.append(labels)
                x_list.append(out)
            head_list.append(1)
            embed_list.append(torch.cat(x_list, dim=0).cpu().numpy())
        y_list = torch.cat(y_list, dim=0)
    embed_list = np.array(embed_list)
    y_list = y_list.cpu().numpy()
    test_f1, test_std = evaluate_graph_embeddings_using_svm(T, embed_list, y_list)
    logger.info(f"#Test_f1: {test_f1:.4f}±{test_std:.4f}")
    return test_f1


def inner_func(args):
    T = args[0]
    train_index = args[1]
    test_index = args[2]
    embed_list = args[3]
    y_list = args[4]
    pred_list = []
    for idx in range(len(T)):
        embeddings = embed_list[idx]
        labels = y_list
        x_train = embeddings[train_index]
        x_test = embeddings[test_index]
        y_train = labels[train_index]
        y_test = labels[test_index]
        params = {"C": [1e-3, 1e-2, 1e-1, 1, 10]}
        svc = SVC(random_state=42)
        clf = GridSearchCV(svc, params)
        clf.fit(x_train, y_train)

        out = clf.predict(x_test)
        pred_list.append(out)
    preds = np.stack(pred_list, axis=0)
    preds = torch.from_numpy(preds)
    preds = torch.mode(preds, dim=0)[0].long().numpy()
    f1 = f1_score(y_test, preds, average="micro")
    return f1


def evaluate_graph_embeddings_using_svm(T, embed_list, y_list):
    kf = StratifiedKFold(n_splits=10, shuffle=True, random_state=0)
    process_args = [(T, train_index, test_index, embed_list, y_list)
                    for train_index, test_index in kf.split(embed_list[0], y_list)]
    with Pool(10) as p:
        result = p.map(inner_func, process_args)
    test_f1 = np.mean(result)
    test_std = np.std(result)

    return test_f1, test_std
