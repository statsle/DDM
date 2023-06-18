#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/qABGl'
export NNI_TRIAL_JOB_ID='qABGl'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/qABGl'
export NNI_TRIAL_SEQ_ID='244'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/qABGl/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/qABGl/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/qABGl/.nni/state'