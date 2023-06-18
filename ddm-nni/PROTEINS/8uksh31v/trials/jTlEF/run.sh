#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/jTlEF'
export NNI_TRIAL_JOB_ID='jTlEF'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/jTlEF'
export NNI_TRIAL_SEQ_ID='148'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/jTlEF/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/jTlEF/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/jTlEF/.nni/state'