#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='qxbzlrwf'
export NNI_SYS_DIR='/ddm-nni/Cora/qxbzlrwf/trials/DFEUc'
export NNI_TRIAL_JOB_ID='DFEUc'
export NNI_OUTPUT_DIR='/ddm-nni/Cora/qxbzlrwf/trials/DFEUc'
export NNI_TRIAL_SEQ_ID='14'
export NNI_CODE_DIR='/ddm-nni/Cora'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Cora/qxbzlrwf/trials/DFEUc/stdout 2>/ddm-nni/Cora/qxbzlrwf/trials/DFEUc/stderr
echo $? `date +%s%3N` >'/ddm-nni/Cora/qxbzlrwf/trials/DFEUc/.nni/state'