#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='s0b1a6mi'
export NNI_SYS_DIR='/ddm-nni/REDDIT-B/s0b1a6mi/trials/Vsm5T'
export NNI_TRIAL_JOB_ID='Vsm5T'
export NNI_OUTPUT_DIR='/ddm-nni/REDDIT-B/s0b1a6mi/trials/Vsm5T'
export NNI_TRIAL_SEQ_ID='1'
export NNI_CODE_DIR='/ddm-nni/REDDIT-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/REDDIT-B/s0b1a6mi/trials/Vsm5T/stdout 2>/ddm-nni/REDDIT-B/s0b1a6mi/trials/Vsm5T/stderr
echo $? `date +%s%3N` >'/ddm-nni/REDDIT-B/s0b1a6mi/trials/Vsm5T/.nni/state'