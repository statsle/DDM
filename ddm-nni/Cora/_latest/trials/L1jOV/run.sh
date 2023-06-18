#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/L1jOV'
export NNI_TRIAL_JOB_ID='L1jOV'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/L1jOV'
export NNI_TRIAL_SEQ_ID='115'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/L1jOV/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/L1jOV/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/L1jOV/.nni/state'