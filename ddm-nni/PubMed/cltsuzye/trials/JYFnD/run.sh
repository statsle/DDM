#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='cltsuzye'
export NNI_SYS_DIR='/ddm-nni/PubMed/cltsuzye/trials/JYFnD'
export NNI_TRIAL_JOB_ID='JYFnD'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/cltsuzye/trials/JYFnD'
export NNI_TRIAL_SEQ_ID='2'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/cltsuzye/trials/JYFnD/stdout 2>/ddm-nni/PubMed/cltsuzye/trials/JYFnD/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/cltsuzye/trials/JYFnD/.nni/state'