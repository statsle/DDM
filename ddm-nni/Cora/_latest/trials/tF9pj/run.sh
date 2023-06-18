#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='hr6c5pba'
export NNI_SYS_DIR='/ddm-nni/Cora/hr6c5pba/trials/tF9pj'
export NNI_TRIAL_JOB_ID='tF9pj'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/hr6c5pba/trials/tF9pj'
export NNI_TRIAL_SEQ_ID='61'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/hr6c5pba/trials/tF9pj/stdout 2>/ddm-nni/Cora/hr6c5pba/trials/tF9pj/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/hr6c5pba/trials/tF9pj/.nni/state'