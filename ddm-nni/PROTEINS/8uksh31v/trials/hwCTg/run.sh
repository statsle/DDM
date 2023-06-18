#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/hwCTg'
export NNI_TRIAL_JOB_ID='hwCTg'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/hwCTg'
export NNI_TRIAL_SEQ_ID='163'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/hwCTg/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/hwCTg/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/hwCTg/.nni/state'