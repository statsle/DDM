#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='cltsuzye'
export NNI_SYS_DIR='/ddm-nni/PubMed/cltsuzye/trials/MEnMf'
export NNI_TRIAL_JOB_ID='MEnMf'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/cltsuzye/trials/MEnMf'
export NNI_TRIAL_SEQ_ID='19'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/cltsuzye/trials/MEnMf/stdout 2>/ddm-nni/PubMed/cltsuzye/trials/MEnMf/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/cltsuzye/trials/MEnMf/.nni/state'