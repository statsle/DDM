#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/t6d1c'
export NNI_TRIAL_JOB_ID='t6d1c'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/t6d1c'
export NNI_TRIAL_SEQ_ID='194'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/t6d1c/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/t6d1c/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/t6d1c/.nni/state'