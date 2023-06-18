#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/nIJaZ'
export NNI_TRIAL_JOB_ID='nIJaZ'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/nIJaZ'
export NNI_TRIAL_SEQ_ID='125'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/nIJaZ/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/nIJaZ/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/nIJaZ/.nni/state'