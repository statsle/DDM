#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/j8TvA'
export NNI_TRIAL_JOB_ID='j8TvA'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/j8TvA'
export NNI_TRIAL_SEQ_ID='133'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/j8TvA/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/j8TvA/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/j8TvA/.nni/state'