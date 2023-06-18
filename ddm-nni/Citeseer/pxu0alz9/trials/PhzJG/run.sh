#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='pxu0alz9'
export NNI_SYS_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/PhzJG'
export NNI_TRIAL_JOB_ID='PhzJG'
export NNI_OUTPUT_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/PhzJG'
export NNI_TRIAL_SEQ_ID='177'
export NNI_CODE_DIR='/ddm-nni/Citeseer'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Citeseer/pxu0alz9/trials/PhzJG/stdout 2>/ddm-nni/Citeseer/pxu0alz9/trials/PhzJG/stderr
echo $? `date +%s%3N` >'/ddm-nni/Citeseer/pxu0alz9/trials/PhzJG/.nni/state'