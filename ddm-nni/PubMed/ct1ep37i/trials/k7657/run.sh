#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='ct1ep37i'
export NNI_SYS_DIR='/ddm-nni/PubMed/ct1ep37i/trials/k7657'
export NNI_TRIAL_JOB_ID='k7657'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/ct1ep37i/trials/k7657'
export NNI_TRIAL_SEQ_ID='34'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/ct1ep37i/trials/k7657/stdout 2>/ddm-nni/PubMed/ct1ep37i/trials/k7657/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/ct1ep37i/trials/k7657/.nni/state'