#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='od5t3qbw'
export NNI_SYS_DIR='/ddm-nni/Cora/od5t3qbw/trials/W4vVM'
export NNI_TRIAL_JOB_ID='W4vVM'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/od5t3qbw/trials/W4vVM'
export NNI_TRIAL_SEQ_ID='58'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/od5t3qbw/trials/W4vVM/stdout 2>/ddm-nni/Cora/od5t3qbw/trials/W4vVM/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/od5t3qbw/trials/W4vVM/.nni/state'