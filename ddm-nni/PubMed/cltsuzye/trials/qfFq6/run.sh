#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='cltsuzye'
export NNI_SYS_DIR='/ddm-nni/PubMed/cltsuzye/trials/qfFq6'
export NNI_TRIAL_JOB_ID='qfFq6'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/cltsuzye/trials/qfFq6'
export NNI_TRIAL_SEQ_ID='70'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/cltsuzye/trials/qfFq6/stdout 2>/ddm-nni/PubMed/cltsuzye/trials/qfFq6/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/cltsuzye/trials/qfFq6/.nni/state'