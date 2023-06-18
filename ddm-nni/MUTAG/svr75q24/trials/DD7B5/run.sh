#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='svr75q24'
export NNI_SYS_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/DD7B5'
export NNI_TRIAL_JOB_ID='DD7B5'
export NNI_OUTPUT_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/DD7B5'
export NNI_TRIAL_SEQ_ID='2'
export NNI_CODE_DIR='/root/autodl-tmp/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/DD7B5/stdout 2>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/DD7B5/stderr
echo $? `date +%s%3N` >'/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/DD7B5/.nni/state'