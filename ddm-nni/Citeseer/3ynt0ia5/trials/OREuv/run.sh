#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='3ynt0ia5'
export NNI_SYS_DIR='/ddm-nni/Citeseer/3ynt0ia5/trials/OREuv'
export NNI_TRIAL_JOB_ID='OREuv'
export NNI_OUTPUT_DIR='/ddm-nni/Citeseer/3ynt0ia5/trials/OREuv'
export NNI_TRIAL_SEQ_ID='11'
export NNI_CODE_DIR='/ddm-nni/Citeseer'
cd $NNI_CODE_DIR
eval 'python main_node.py' 1>/ddm-nni/Citeseer/3ynt0ia5/trials/OREuv/stdout 2>/ddm-nni/Citeseer/3ynt0ia5/trials/OREuv/stderr
echo $? `date +%s%3N` >'/ddm-nni/Citeseer/3ynt0ia5/trials/OREuv/.nni/state'