#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='picyxa7m'
export NNI_SYS_DIR='/ddm-nni/PubMed/picyxa7m/trials/a7Nww'
export NNI_TRIAL_JOB_ID='a7Nww'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/picyxa7m/trials/a7Nww'
export NNI_TRIAL_SEQ_ID='9'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/picyxa7m/trials/a7Nww/stdout 2>/ddm-nni/PubMed/picyxa7m/trials/a7Nww/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/picyxa7m/trials/a7Nww/.nni/state'