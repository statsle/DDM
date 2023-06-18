#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/CVcFB'
export NNI_TRIAL_JOB_ID='CVcFB'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/CVcFB'
export NNI_TRIAL_SEQ_ID='27'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/CVcFB/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/CVcFB/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/CVcFB/.nni/state'