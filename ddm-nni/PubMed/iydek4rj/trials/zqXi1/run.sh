#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='iydek4rj'
export NNI_SYS_DIR='/ddm-nni/PubMed/iydek4rj/trials/zqXi1'
export NNI_TRIAL_JOB_ID='zqXi1'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/iydek4rj/trials/zqXi1'
export NNI_TRIAL_SEQ_ID='14'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/iydek4rj/trials/zqXi1/stdout 2>/ddm-nni/PubMed/iydek4rj/trials/zqXi1/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/iydek4rj/trials/zqXi1/.nni/state'