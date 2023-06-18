#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='lpvgaydw'
export NNI_SYS_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/zl4rS'
export NNI_TRIAL_JOB_ID='zl4rS'
export NNI_OUTPUT_DIR='/ddm-nni/IMDB-B/lpvgaydw/trials/zl4rS'
export NNI_TRIAL_SEQ_ID='7'
export NNI_CODE_DIR='/ddm-nni/IMDB-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/IMDB-B/lpvgaydw/trials/zl4rS/stdout 2>/ddm-nni/IMDB-B/lpvgaydw/trials/zl4rS/stderr
echo $? `date +%s%3N` >'/ddm-nni/IMDB-B/lpvgaydw/trials/zl4rS/.nni/state'