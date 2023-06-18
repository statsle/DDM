#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='cltsuzye'
export NNI_SYS_DIR='/ddm-nni/PubMed/cltsuzye/trials/g2tcb'
export NNI_TRIAL_JOB_ID='g2tcb'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/cltsuzye/trials/g2tcb'
export NNI_TRIAL_SEQ_ID='24'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/cltsuzye/trials/g2tcb/stdout 2>/ddm-nni/PubMed/cltsuzye/trials/g2tcb/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/cltsuzye/trials/g2tcb/.nni/state'