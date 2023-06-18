#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/x43cX'
export NNI_TRIAL_JOB_ID='x43cX'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/x43cX'
export NNI_TRIAL_SEQ_ID='51'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/x43cX/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/x43cX/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/x43cX/.nni/state'