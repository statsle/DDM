#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='svr75q24'
export NNI_SYS_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/IQZgC'
export NNI_TRIAL_JOB_ID='IQZgC'
export NNI_OUTPUT_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/IQZgC'
export NNI_TRIAL_SEQ_ID='6'
export NNI_CODE_DIR='/root/autodl-tmp/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/IQZgC/stdout 2>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/IQZgC/stderr
echo $? `date +%s%3N` >'/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/IQZgC/.nni/state'