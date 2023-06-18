#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='svr75q24'
export NNI_SYS_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/qLOBI'
export NNI_TRIAL_JOB_ID='qLOBI'
export NNI_OUTPUT_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/qLOBI'
export NNI_TRIAL_SEQ_ID='11'
export NNI_CODE_DIR='/root/autodl-tmp/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/qLOBI/stdout 2>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/qLOBI/stderr
echo $? `date +%s%3N` >'/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/qLOBI/.nni/state'