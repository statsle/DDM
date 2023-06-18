#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/iH0lq'
export NNI_TRIAL_JOB_ID='iH0lq'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/iH0lq'
export NNI_TRIAL_SEQ_ID='39'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/iH0lq/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/iH0lq/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/iH0lq/.nni/state'