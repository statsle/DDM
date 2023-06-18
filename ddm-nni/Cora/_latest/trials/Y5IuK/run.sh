#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/Y5IuK'
export NNI_TRIAL_JOB_ID='Y5IuK'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/Y5IuK'
export NNI_TRIAL_SEQ_ID='260'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/Y5IuK/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/Y5IuK/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/Y5IuK/.nni/state'