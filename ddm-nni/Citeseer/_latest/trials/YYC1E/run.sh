#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='pxu0alz9'
export NNI_SYS_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/YYC1E'
export NNI_TRIAL_JOB_ID='YYC1E'
export NNI_OUTPUT_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/YYC1E'
export NNI_TRIAL_SEQ_ID='116'
export NNI_CODE_DIR='/ddm-nni/Citeseer'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Citeseer/pxu0alz9/trials/YYC1E/stdout 2>/ddm-nni/Citeseer/pxu0alz9/trials/YYC1E/stderr
echo $? `date +%s%3N` >'/ddm-nni/Citeseer/pxu0alz9/trials/YYC1E/.nni/state'