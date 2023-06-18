#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/lynne'
export NNI_TRIAL_JOB_ID='lynne'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/lynne'
export NNI_TRIAL_SEQ_ID='291'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/lynne/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/lynne/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/lynne/.nni/state'