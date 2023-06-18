#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='cltsuzye'
export NNI_SYS_DIR='/ddm-nni/PubMed/cltsuzye/trials/Qun9L'
export NNI_TRIAL_JOB_ID='Qun9L'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/cltsuzye/trials/Qun9L'
export NNI_TRIAL_SEQ_ID='69'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/cltsuzye/trials/Qun9L/stdout 2>/ddm-nni/PubMed/cltsuzye/trials/Qun9L/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/cltsuzye/trials/Qun9L/.nni/state'