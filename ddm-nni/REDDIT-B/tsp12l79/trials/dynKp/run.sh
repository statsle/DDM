#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='tsp12l79'
export NNI_SYS_DIR='/ddm-nni/REDDIT-B/tsp12l79/trials/dynKp'
export NNI_TRIAL_JOB_ID='dynKp'
export NNI_OUTPUT_DIR='/ddm-nni/REDDIT-B/tsp12l79/trials/dynKp'
export NNI_TRIAL_SEQ_ID='0'
export NNI_CODE_DIR='/ddm-nni/REDDIT-B'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/REDDIT-B/tsp12l79/trials/dynKp/stdout 2>/ddm-nni/REDDIT-B/tsp12l79/trials/dynKp/stderr
echo $? `date +%s%3N` >'/ddm-nni/REDDIT-B/tsp12l79/trials/dynKp/.nni/state'