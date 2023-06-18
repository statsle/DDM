#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/o09j8'
export NNI_TRIAL_JOB_ID='o09j8'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/o09j8'
export NNI_TRIAL_SEQ_ID='101'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/o09j8/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/o09j8/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/o09j8/.nni/state'