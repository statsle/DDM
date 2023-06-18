#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/Ss6Wd'
export NNI_TRIAL_JOB_ID='Ss6Wd'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/Ss6Wd'
export NNI_TRIAL_SEQ_ID='61'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/Ss6Wd/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/Ss6Wd/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/Ss6Wd/.nni/state'