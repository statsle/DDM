#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='ct1ep37i'
export NNI_SYS_DIR='/ddm-nni/PubMed/ct1ep37i/trials/PT4j2'
export NNI_TRIAL_JOB_ID='PT4j2'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/ct1ep37i/trials/PT4j2'
export NNI_TRIAL_SEQ_ID='43'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/ct1ep37i/trials/PT4j2/stdout 2>/ddm-nni/PubMed/ct1ep37i/trials/PT4j2/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/ct1ep37i/trials/PT4j2/.nni/state'