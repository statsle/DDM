#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/L1IFJ'
export NNI_TRIAL_JOB_ID='L1IFJ'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/L1IFJ'
export NNI_TRIAL_SEQ_ID='235'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/L1IFJ/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/L1IFJ/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/L1IFJ/.nni/state'