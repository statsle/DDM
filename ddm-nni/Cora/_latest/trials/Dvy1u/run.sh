#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/Dvy1u'
export NNI_TRIAL_JOB_ID='Dvy1u'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/Dvy1u'
export NNI_TRIAL_SEQ_ID='339'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/Dvy1u/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/Dvy1u/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/Dvy1u/.nni/state'