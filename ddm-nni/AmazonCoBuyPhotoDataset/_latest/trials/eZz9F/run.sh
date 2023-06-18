#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='t3a9r6ez'
export NNI_SYS_DIR='/ddm-nni/AmazonCoBuyPhotoDataset/t3a9r6ez/trials/eZz9F'
export NNI_TRIAL_JOB_ID='eZz9F'
export NNI_OUTPUT_DIR='/ddm-nni/AmazonCoBuyPhotoDataset/t3a9r6ez/trials/eZz9F'
export NNI_TRIAL_SEQ_ID='87'
export NNI_CODE_DIR='/ddm-nni/AmazonCoBuyPhotoDataset'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/AmazonCoBuyPhotoDataset/t3a9r6ez/trials/eZz9F/stdout 2>/ddm-nni/AmazonCoBuyPhotoDataset/t3a9r6ez/trials/eZz9F/stderr
echo $? `date +%s%3N` >'/ddm-nni/AmazonCoBuyPhotoDataset/t3a9r6ez/trials/eZz9F/.nni/state'