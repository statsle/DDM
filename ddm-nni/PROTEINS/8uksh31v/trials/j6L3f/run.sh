#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/j6L3f'
export NNI_TRIAL_JOB_ID='j6L3f'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/j6L3f'
export NNI_TRIAL_SEQ_ID='48'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/j6L3f/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/j6L3f/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/j6L3f/.nni/state'