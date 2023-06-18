#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/XloWv'
export NNI_TRIAL_JOB_ID='XloWv'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/XloWv'
export NNI_TRIAL_SEQ_ID='187'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/XloWv/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/XloWv/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/XloWv/.nni/state'