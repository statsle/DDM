#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/iNaOa'
export NNI_TRIAL_JOB_ID='iNaOa'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/iNaOa'
export NNI_TRIAL_SEQ_ID='68'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/iNaOa/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/iNaOa/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/iNaOa/.nni/state'