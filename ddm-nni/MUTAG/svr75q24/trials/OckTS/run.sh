#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='svr75q24'
export NNI_SYS_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/OckTS'
export NNI_TRIAL_JOB_ID='OckTS'
export NNI_OUTPUT_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/OckTS'
export NNI_TRIAL_SEQ_ID='10'
export NNI_CODE_DIR='/root/autodl-tmp/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/OckTS/stdout 2>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/OckTS/stderr
echo $? `date +%s%3N` >'/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/OckTS/.nni/state'