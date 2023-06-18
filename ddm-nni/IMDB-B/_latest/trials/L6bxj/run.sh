#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/L6bxj'
export NNI_TRIAL_JOB_ID='L6bxj'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/L6bxj'
export NNI_TRIAL_SEQ_ID='196'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/L6bxj/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/L6bxj/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/L6bxj/.nni/state'