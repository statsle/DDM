#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/Yh4Tu'
export NNI_TRIAL_JOB_ID='Yh4Tu'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/Yh4Tu'
export NNI_TRIAL_SEQ_ID='189'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/Yh4Tu/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/Yh4Tu/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/Yh4Tu/.nni/state'