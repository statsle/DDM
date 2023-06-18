#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='picyxa7m'
export NNI_SYS_DIR='/ddm-nni/PubMed/picyxa7m/trials/dsnpR'
export NNI_TRIAL_JOB_ID='dsnpR'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/picyxa7m/trials/dsnpR'
export NNI_TRIAL_SEQ_ID='10'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/picyxa7m/trials/dsnpR/stdout 2>/ddm-nni/PubMed/picyxa7m/trials/dsnpR/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/picyxa7m/trials/dsnpR/.nni/state'