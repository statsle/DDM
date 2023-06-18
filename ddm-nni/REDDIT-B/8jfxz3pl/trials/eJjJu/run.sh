#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8jfxz3pl'
export NNI_SYS_DIR='/ddm-nni/REDDIT-B/8jfxz3pl/trials/eJjJu'
export NNI_TRIAL_JOB_ID='eJjJu'
export NNI_OUTPUT_DIR='/ddm-nni/REDDIT-B/8jfxz3pl/trials/eJjJu'
export NNI_TRIAL_SEQ_ID='252'
export NNI_CODE_DIR='/ddm-nni/REDDIT-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/REDDIT-B/8jfxz3pl/trials/eJjJu/stdout 2>/ddm-nni/REDDIT-B/8jfxz3pl/trials/eJjJu/stderr
echo $? `date +%s%3N` >'/ddm-nni/REDDIT-B/8jfxz3pl/trials/eJjJu/.nni/state'