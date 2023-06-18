#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/WJczG'
export NNI_TRIAL_JOB_ID='WJczG'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/WJczG'
export NNI_TRIAL_SEQ_ID='29'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/WJczG/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/WJczG/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/WJczG/.nni/state'