#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/o89QO'
export NNI_TRIAL_JOB_ID='o89QO'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/o89QO'
export NNI_TRIAL_SEQ_ID='213'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/o89QO/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/o89QO/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/o89QO/.nni/state'