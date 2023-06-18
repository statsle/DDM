#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='ct1ep37i'
export NNI_SYS_DIR='/ddm-nni/PubMed/ct1ep37i/trials/Bvc4s'
export NNI_TRIAL_JOB_ID='Bvc4s'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/ct1ep37i/trials/Bvc4s'
export NNI_TRIAL_SEQ_ID='45'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/ct1ep37i/trials/Bvc4s/stdout 2>/ddm-nni/PubMed/ct1ep37i/trials/Bvc4s/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/ct1ep37i/trials/Bvc4s/.nni/state'