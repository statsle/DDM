#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='od5t3qbw'
export NNI_SYS_DIR='/ddm-nni/Cora/od5t3qbw/trials/c4X7Z'
export NNI_TRIAL_JOB_ID='c4X7Z'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/od5t3qbw/trials/c4X7Z'
export NNI_TRIAL_SEQ_ID='256'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/od5t3qbw/trials/c4X7Z/stdout 2>/ddm-nni/Cora/od5t3qbw/trials/c4X7Z/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/od5t3qbw/trials/c4X7Z/.nni/state'