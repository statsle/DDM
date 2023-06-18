#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='iydek4rj'
export NNI_SYS_DIR='/ddm-nni/PubMed/iydek4rj/trials/bhjVB'
export NNI_TRIAL_JOB_ID='bhjVB'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/iydek4rj/trials/bhjVB'
export NNI_TRIAL_SEQ_ID='18'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/iydek4rj/trials/bhjVB/stdout 2>/ddm-nni/PubMed/iydek4rj/trials/bhjVB/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/iydek4rj/trials/bhjVB/.nni/state'