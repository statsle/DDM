# Copyright (c) Tencent, Inc. and its affiliates. All Rights Reserved.
import errno
import logging
import os


def mkdir(path):
    try:
        os.makedirs(path)
    except OSError as e:
        if e.errno != errno.EEXIST:
            raise


def link_file(src, target):
    """symbol link the source directories to target."""
    if os.path.isdir(target) or os.path.isfile(target):
        os.remove(target)
    os.system('ln -s {} {}'.format(src, target))


def print_model_parameters(model,logger,  only_num=True):
    logger.info('*****************Model Parameter*****************')
    if not only_num:
        for name, param in model.named_parameters():
            logger.info(name, param.shape, param.requires_grad)
    total_num = sum([param.nelement() for param in model.parameters()])
    logger.info('Total params num: {}'.format(total_num))
    logger.info('*****************Finish Parameter****************')
