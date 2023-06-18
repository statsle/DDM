#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='8ij2p56w'
export NNI_SYS_DIR='/ddm-nni/PubMed/8ij2p56w/trials/TL7td'
export NNI_TRIAL_JOB_ID='TL7td'
export NNI_OUTPUT_DIR='/ddm-nni/PubMed/8ij2p56w/trials/TL7td'
export NNI_TRIAL_SEQ_ID='0'
export NNI_CODE_DIR='/ddm-nni/PubMed'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/PubMed/8ij2p56w/trials/TL7td/stdout 2>/ddm-nni/PubMed/8ij2p56w/trials/TL7td/stderr
echo $? `date +%s%3N` >'/ddm-nni/PubMed/8ij2p56w/trials/TL7td/.nni/state'