#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/jGzpz'
export NNI_TRIAL_JOB_ID='jGzpz'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/jGzpz'
export NNI_TRIAL_SEQ_ID='257'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/jGzpz/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/jGzpz/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/jGzpz/.nni/state'