#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/ZYI2l'
export NNI_TRIAL_JOB_ID='ZYI2l'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/ZYI2l'
export NNI_TRIAL_SEQ_ID='254'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/ZYI2l/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/ZYI2l/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/ZYI2l/.nni/state'