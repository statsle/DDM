#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/rEj5q'
export NNI_TRIAL_JOB_ID='rEj5q'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/rEj5q'
export NNI_TRIAL_SEQ_ID='424'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/rEj5q/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/rEj5q/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/rEj5q/.nni/state'