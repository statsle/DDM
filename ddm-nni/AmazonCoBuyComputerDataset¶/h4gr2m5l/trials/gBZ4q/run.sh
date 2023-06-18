#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='h4gr2m5l'
export NNI_SYS_DIR='/ddm-nni/AmazonCoBuyComputerDataset¶/h4gr2m5l/trials/gBZ4q'
export NNI_TRIAL_JOB_ID='gBZ4q'
export NNI_OUTPUT_DIR='/ddm-nni/AmazonCoBuyComputerDataset¶/h4gr2m5l/trials/gBZ4q'
export NNI_TRIAL_SEQ_ID='0'
export NNI_CODE_DIR='/ddm-nni/AmazonCoBuyComputerDataset¶'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/AmazonCoBuyComputerDataset¶/h4gr2m5l/trials/gBZ4q/stdout 2>/ddm-nni/AmazonCoBuyComputerDataset¶/h4gr2m5l/trials/gBZ4q/stderr
echo $? `date +%s%3N` >'/ddm-nni/AmazonCoBuyComputerDataset¶/h4gr2m5l/trials/gBZ4q/.nni/state'