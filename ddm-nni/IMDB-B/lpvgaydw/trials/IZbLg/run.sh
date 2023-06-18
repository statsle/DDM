#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/IZbLg'
export NNI_TRIAL_JOB_ID='IZbLg'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/IZbLg'
export NNI_TRIAL_SEQ_ID='109'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/IZbLg/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/IZbLg/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/IZbLg/.nni/state'