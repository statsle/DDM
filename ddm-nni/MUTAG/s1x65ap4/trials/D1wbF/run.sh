#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s1x65ap4'
export NNI_SYS_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/D1wbF'
export NNI_TRIAL_JOB_ID='D1wbF'
export NNI_OUTPUT_DIR='/ddm-nni/MUTAG/s1x65ap4/trials/D1wbF'
export NNI_TRIAL_SEQ_ID='80'
export NNI_CODE_DIR='/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/MUTAG/s1x65ap4/trials/D1wbF/stdout 2>/ddm-nni/MUTAG/s1x65ap4/trials/D1wbF/stderr
echo $? `date +%s%3N` >'/ddm-nni/MUTAG/s1x65ap4/trials/D1wbF/.nni/state'