#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='flqe94h0'
export NNI_SYS_DIR='/ddm-nni/Cora/flqe94h0/trials/VwqKy'
export NNI_TRIAL_JOB_ID='VwqKy'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/flqe94h0/trials/VwqKy'
export NNI_TRIAL_SEQ_ID='2'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/flqe94h0/trials/VwqKy/stdout 2>/ddm-nni/Cora/flqe94h0/trials/VwqKy/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/flqe94h0/trials/VwqKy/.nni/state'