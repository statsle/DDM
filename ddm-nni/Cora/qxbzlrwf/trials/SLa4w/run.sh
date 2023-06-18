#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/SLa4w'
export NNI_TRIAL_JOB_ID='SLa4w'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/SLa4w'
export NNI_TRIAL_SEQ_ID='98'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/SLa4w/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/SLa4w/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/SLa4w/.nni/state'