#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/MBZLs'
export NNI_TRIAL_JOB_ID='MBZLs'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/MBZLs'
export NNI_TRIAL_SEQ_ID='62'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/MBZLs/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/MBZLs/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/MBZLs/.nni/state'