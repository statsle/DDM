#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='ct1ep37i'
export NNI_SYS_DIR='/ddm-nni/PubMed/ct1ep37i/trials/NHqXF'
export NNI_TRIAL_JOB_ID='NHqXF'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/ct1ep37i/trials/NHqXF'
export NNI_TRIAL_SEQ_ID='28'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/ct1ep37i/trials/NHqXF/stdout 2>/ddm-nni/PubMed/ct1ep37i/trials/NHqXF/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/ct1ep37i/trials/NHqXF/.nni/state'