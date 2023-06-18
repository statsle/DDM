#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/R2cUO'
export NNI_TRIAL_JOB_ID='R2cUO'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/R2cUO'
export NNI_TRIAL_SEQ_ID='286'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/R2cUO/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/R2cUO/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/R2cUO/.nni/state'