#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/YArTo'
export NNI_TRIAL_JOB_ID='YArTo'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/YArTo'
export NNI_TRIAL_SEQ_ID='446'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/YArTo/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/YArTo/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/YArTo/.nni/state'