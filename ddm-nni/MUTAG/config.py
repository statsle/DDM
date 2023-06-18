from easydict import EasyDict as edict
import os.path as osp


class Config:
    root_dir = osp.abspath(osp.dirname(__file__))
    output_dir = osp.join(root_dir, 'log-ddm-T')
    checkpoint_dir = osp.join(output_dir, "checkpoint")
    pretrain_checkpoint_dir = osp.join(root_dir, "log-checkpoint", "checkpoint", "model_best.pth.tar")
    pooler = 'mean'
    # decay = 10
    decay = 35
    # seeds = [418]
    # seeds = [11, 15, 2]
    seeds = [11]
    # T = [0, 5, 10, 20]
    T = [50, 100, 200]
    # T = [25, 75, 125, 175, 225]
    # device
    DEVICE = "cuda"
    # DEVICE = "cpu"
    # data
    DATA = edict()
    DATA.data_name = 'MUTAG'
    DATA.deg4feat = True

    # dataloader
    DATALOADER = edict()
    DATALOADER.NUM_WORKERS = 0
    DATALOADER.BATCH_SIZE = 32

    # model
    MODEL = edict()
    MODEL.num_heads = 4
    MODEL.num_out_heads = 1
    MODEL.num_hidden = 512
    # MODEL.num_hidden = 512
    MODEL.num_layers = 2
    MODEL.residual = False
    MODEL.attn_drop = 0.1
    MODEL.in_drop = 0.2
    MODEL.norm = 'layernorm'
    MODEL.negative_slope = 0.2
    MODEL.encoder_type = 'gunet_enc'
    MODEL.decoder_type = 'gunet_dec'
    MODEL.activation = 'prelu'
    MODEL.encoder = 'gunet_enc'
    MODEL.decoder = 'gunet_dec'
    MODEL.loss_fn = 'mse'
    MODEL.concat_hidden = False
    MODEL.ks = [0.9, 0.8, 0.7]

    # solver
    SOLVER = edict()
    SOLVER.optim_type = 'adamw'
    SOLVER.optim_type_f = 'adamw'
    SOLVER.alpha = 0.8
    SOLVER.decay = 35
    SOLVER.LR = 0.00005
    # SOLVER.LR = 0.0002
    # SOLVER.LR_f = 0.01
    SOLVER.LR_f = 0.005
    SOLVER.weight_decay = 5e-4
    SOLVER.weight_decay_f = 5e-4
    # SOLVER.use_scheduler = False
    SOLVER.use_scheduler = False
    SOLVER.MAX_EPOCH = 10
    SOLVER.max_epoch_f = 200




config = Config()
