#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8jfxz3pl'
export NNI_SYS_DIR='/ddm-nni/REDDIT-B/8jfxz3pl/trials/vL0Sj'
export NNI_TRIAL_JOB_ID='vL0Sj'
export NNI_OUTPUT_DIR='/ddm-nni/REDDIT-B/8jfxz3pl/trials/vL0Sj'
export NNI_TRIAL_SEQ_ID='190'
export NNI_CODE_DIR='/ddm-nni/REDDIT-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/REDDIT-B/8jfxz3pl/trials/vL0Sj/stdout 2>/ddm-nni/REDDIT-B/8jfxz3pl/trials/vL0Sj/stderr
echo $? `date +%s%3N` >'/ddm-nni/REDDIT-B/8jfxz3pl/trials/vL0Sj/.nni/state'