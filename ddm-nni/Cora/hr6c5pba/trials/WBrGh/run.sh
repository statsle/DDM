#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/WBrGh'
export NNI_TRIAL_JOB_ID='WBrGh'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/WBrGh'
export NNI_TRIAL_SEQ_ID='146'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/WBrGh/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/WBrGh/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/WBrGh/.nni/state'