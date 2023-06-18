#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/ruCbX'
export NNI_TRIAL_JOB_ID='ruCbX'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/ruCbX'
export NNI_TRIAL_SEQ_ID='3'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/ruCbX/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/ruCbX/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/ruCbX/.nni/state'