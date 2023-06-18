#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='picyxa7m'
export NNI_SYS_DIR='/ddm-nni/PubMed/picyxa7m/trials/ORCCo'
export NNI_TRIAL_JOB_ID='ORCCo'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/picyxa7m/trials/ORCCo'
export NNI_TRIAL_SEQ_ID='15'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/picyxa7m/trials/ORCCo/stdout 2>/ddm-nni/PubMed/picyxa7m/trials/ORCCo/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/picyxa7m/trials/ORCCo/.nni/state'