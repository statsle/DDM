#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/CM6H1'
export NNI_TRIAL_JOB_ID='CM6H1'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/CM6H1'
export NNI_TRIAL_SEQ_ID='69'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/CM6H1/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/CM6H1/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/CM6H1/.nni/state'