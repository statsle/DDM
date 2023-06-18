#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='0ce6vkp8'
export NNI_SYS_DIR='/ddm-nni/REDDIT-B/0ce6vkp8/trials/Xxhv5'
export NNI_TRIAL_JOB_ID='Xxhv5'
export NNI_OUTPUT_DIR='/ddm-nni/REDDIT-B/0ce6vkp8/trials/Xxhv5'
export NNI_TRIAL_SEQ_ID='0'
export NNI_CODE_DIR='/ddm-nni/REDDIT-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/REDDIT-B/0ce6vkp8/trials/Xxhv5/stdout 2>/ddm-nni/REDDIT-B/0ce6vkp8/trials/Xxhv5/stderr
echo $? `date +%s%3N` >'/ddm-nni/REDDIT-B/0ce6vkp8/trials/Xxhv5/.nni/state'