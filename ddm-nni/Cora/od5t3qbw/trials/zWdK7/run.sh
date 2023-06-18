#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='od5t3qbw'
export NNI_SYS_DIR='/ddm-nni/Cora/od5t3qbw/trials/zWdK7'
export NNI_TRIAL_JOB_ID='zWdK7'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/od5t3qbw/trials/zWdK7'
export NNI_TRIAL_SEQ_ID='153'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/od5t3qbw/trials/zWdK7/stdout 2>/ddm-nni/Cora/od5t3qbw/trials/zWdK7/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/od5t3qbw/trials/zWdK7/.nni/state'