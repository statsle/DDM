#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/D114w'
export NNI_TRIAL_JOB_ID='D114w'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/D114w'
export NNI_TRIAL_SEQ_ID='213'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/D114w/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/D114w/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/D114w/.nni/state'