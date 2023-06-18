#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/foWb0'
export NNI_TRIAL_JOB_ID='foWb0'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/foWb0'
export NNI_TRIAL_SEQ_ID='64'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/foWb0/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/foWb0/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/foWb0/.nni/state'