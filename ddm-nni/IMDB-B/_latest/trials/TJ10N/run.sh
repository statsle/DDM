#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/TJ10N'
export NNI_TRIAL_JOB_ID='TJ10N'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/TJ10N'
export NNI_TRIAL_SEQ_ID='187'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/TJ10N/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/TJ10N/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/TJ10N/.nni/state'