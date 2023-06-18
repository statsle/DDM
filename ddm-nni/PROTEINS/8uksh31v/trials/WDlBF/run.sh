#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8uksh31v'
export NNI_SYS_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/WDlBF'
export NNI_TRIAL_JOB_ID='WDlBF'
export NNI_OUTPUT_DIR='/ddm-nni/PROTEINS/8uksh31v/trials/WDlBF'
export NNI_TRIAL_SEQ_ID='178'
export NNI_CODE_DIR='/ddm-nni/PROTEINS'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/ddm-nni/PROTEINS/8uksh31v/trials/WDlBF/stdout 2>/ddm-nni/PROTEINS/8uksh31v/trials/WDlBF/stderr
echo $? `date +%s%3N` >'/ddm-nni/PROTEINS/8uksh31v/trials/WDlBF/.nni/state'