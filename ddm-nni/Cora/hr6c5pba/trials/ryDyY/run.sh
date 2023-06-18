#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/ryDyY'
export NNI_TRIAL_JOB_ID='ryDyY'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/ryDyY'
export NNI_TRIAL_SEQ_ID='133'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/ryDyY/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/ryDyY/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/ryDyY/.nni/state'