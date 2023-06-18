#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/VV3LA'
export NNI_TRIAL_JOB_ID='VV3LA'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/VV3LA'
export NNI_TRIAL_SEQ_ID='164'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/VV3LA/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/VV3LA/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/VV3LA/.nni/state'