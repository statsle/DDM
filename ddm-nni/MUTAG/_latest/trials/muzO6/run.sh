#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/muzO6'
export NNI_TRIAL_JOB_ID='muzO6'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/muzO6'
export NNI_TRIAL_SEQ_ID='217'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/muzO6/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/muzO6/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/muzO6/.nni/state'