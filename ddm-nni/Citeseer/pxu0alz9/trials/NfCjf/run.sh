#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='pxu0alz9'
export NNI_SYS_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/NfCjf'
export NNI_TRIAL_JOB_ID='NfCjf'
export NNI_OUTPUT_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/NfCjf'
export NNI_TRIAL_SEQ_ID='209'
export NNI_CODE_DIR='/ddm-nni/Citeseer'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Citeseer/pxu0alz9/trials/NfCjf/stdout 2>/ddm-nni/Citeseer/pxu0alz9/trials/NfCjf/stderr
echo $? `date +%s%3N` >'/ddm-nni/Citeseer/pxu0alz9/trials/NfCjf/.nni/state'