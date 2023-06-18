#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='pxu0alz9'
export NNI_SYS_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/tMJdC'
export NNI_TRIAL_JOB_ID='tMJdC'
export NNI_OUTPUT_DIR='/ddm-nni/Citeseer/pxu0alz9/trials/tMJdC'
export NNI_TRIAL_SEQ_ID='474'
export NNI_CODE_DIR='/ddm-nni/Citeseer'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Citeseer/pxu0alz9/trials/tMJdC/stdout 2>/ddm-nni/Citeseer/pxu0alz9/trials/tMJdC/stderr
echo $? `date +%s%3N` >'/ddm-nni/Citeseer/pxu0alz9/trials/tMJdC/.nni/state'