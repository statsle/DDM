#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/tXG0w'
export NNI_TRIAL_JOB_ID='tXG0w'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/tXG0w'
export NNI_TRIAL_SEQ_ID='140'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/tXG0w/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/tXG0w/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/tXG0w/.nni/state'