#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/M3SPi'
export NNI_TRIAL_JOB_ID='M3SPi'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/M3SPi'
export NNI_TRIAL_SEQ_ID='42'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/M3SPi/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/M3SPi/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/M3SPi/.nni/state'