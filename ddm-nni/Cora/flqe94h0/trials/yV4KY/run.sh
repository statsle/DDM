#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='flqe94h0'
export NNI_SYS_DIR='/ddm-nni/Cora/flqe94h0/trials/yV4KY'
export NNI_TRIAL_JOB_ID='yV4KY'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/flqe94h0/trials/yV4KY'
export NNI_TRIAL_SEQ_ID='17'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/flqe94h0/trials/yV4KY/stdout 2>/ddm-nni/Cora/flqe94h0/trials/yV4KY/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/flqe94h0/trials/yV4KY/.nni/state'