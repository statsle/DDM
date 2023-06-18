#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8ij2p56w'
export NNI_SYS_DIR='/ddm-nni/PubMed/8ij2p56w/trials/w6aSg'
export NNI_TRIAL_JOB_ID='w6aSg'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/8ij2p56w/trials/w6aSg'
export NNI_TRIAL_SEQ_ID='1'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/8ij2p56w/trials/w6aSg/stdout 2>/ddm-nni/PubMed/8ij2p56w/trials/w6aSg/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/8ij2p56w/trials/w6aSg/.nni/state'