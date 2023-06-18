#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='svr75q24'
export NNI_SYS_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/p5epW'
export NNI_TRIAL_JOB_ID='p5epW'
export NNI_OUTPUT_DIR='/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/p5epW'
export NNI_TRIAL_SEQ_ID='9'
export NNI_CODE_DIR='/root/autodl-tmp/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/p5epW/stdout 2>/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/p5epW/stderr
echo $? `date +%s%3N` >'/root/autodl-tmp/ddm-nni/MUTAG/svr75q24/trials/p5epW/.nni/state'