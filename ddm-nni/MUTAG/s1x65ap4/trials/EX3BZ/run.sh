#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/EX3BZ'
export NNI_TRIAL_JOB_ID='EX3BZ'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/EX3BZ'
export NNI_TRIAL_SEQ_ID='78'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/EX3BZ/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/EX3BZ/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/EX3BZ/.nni/state'