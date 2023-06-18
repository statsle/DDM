#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='ct1ep37i'
export NNI_SYS_DIR='/ddm-nni/PubMed/ct1ep37i/trials/ZUKrT'
export NNI_TRIAL_JOB_ID='ZUKrT'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/ct1ep37i/trials/ZUKrT'
export NNI_TRIAL_SEQ_ID='2'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/ct1ep37i/trials/ZUKrT/stdout 2>/ddm-nni/PubMed/ct1ep37i/trials/ZUKrT/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/ct1ep37i/trials/ZUKrT/.nni/state'