#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/A3Zfl'
export NNI_TRIAL_JOB_ID='A3Zfl'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/A3Zfl'
export NNI_TRIAL_SEQ_ID='228'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/A3Zfl/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/A3Zfl/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/A3Zfl/.nni/state'