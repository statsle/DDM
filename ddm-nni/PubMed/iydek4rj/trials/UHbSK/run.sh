#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='iydek4rj'
export NNI_SYS_DIR='/ddm-nni/PubMed/iydek4rj/trials/UHbSK'
export NNI_TRIAL_JOB_ID='UHbSK'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/iydek4rj/trials/UHbSK'
export NNI_TRIAL_SEQ_ID='6'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/iydek4rj/trials/UHbSK/stdout 2>/ddm-nni/PubMed/iydek4rj/trials/UHbSK/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/iydek4rj/trials/UHbSK/.nni/state'