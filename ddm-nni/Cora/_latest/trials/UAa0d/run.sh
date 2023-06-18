#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/UAa0d'
export NNI_TRIAL_JOB_ID='UAa0d'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/UAa0d'
export NNI_TRIAL_SEQ_ID='148'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/UAa0d/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/UAa0d/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/UAa0d/.nni/state'