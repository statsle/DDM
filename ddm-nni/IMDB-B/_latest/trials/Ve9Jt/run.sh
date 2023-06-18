#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/Ve9Jt'
export NNI_TRIAL_JOB_ID='Ve9Jt'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/Ve9Jt'
export NNI_TRIAL_SEQ_ID='287'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/Ve9Jt/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/Ve9Jt/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/Ve9Jt/.nni/state'