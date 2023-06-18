#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='0ce6vkp8'
export NNI_SYS_DIR='/ddm-nni/REDDIT-B/0ce6vkp8/trials/sVl8i'
export NNI_TRIAL_JOB_ID='sVl8i'
export NNI_OUTPUT_DIR='/ddm-nni/REDDIT-B/0ce6vkp8/trials/sVl8i'
export NNI_TRIAL_SEQ_ID='1'
export NNI_CODE_DIR='/ddm-nni/REDDIT-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/REDDIT-B/0ce6vkp8/trials/sVl8i/stdout 2>/ddm-nni/REDDIT-B/0ce6vkp8/trials/sVl8i/stderr
echo $? `date +%s%3N` >'/ddm-nni/REDDIT-B/0ce6vkp8/trials/sVl8i/.nni/state'