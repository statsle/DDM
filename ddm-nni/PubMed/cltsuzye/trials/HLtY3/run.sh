#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='cltsuzye'
export NNI_SYS_DIR='/ddm-nni/PubMed/cltsuzye/trials/HLtY3'
export NNI_TRIAL_JOB_ID='HLtY3'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/cltsuzye/trials/HLtY3'
export NNI_TRIAL_SEQ_ID='86'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/cltsuzye/trials/HLtY3/stdout 2>/ddm-nni/PubMed/cltsuzye/trials/HLtY3/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/cltsuzye/trials/HLtY3/.nni/state'