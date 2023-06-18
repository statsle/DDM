#!/bin/bash
export NNI_PLATFORM='local'
export NNI_EXP_ID='5w172ph9'
export NNI_SYS_DIR='/root/autodl-tmp/ddm-nni/MUTAG/5w172ph9/trials/IyyZY'
export NNI_TRIAL_JOB_ID='IyyZY'
export NNI_OUTPUT_DIR='/root/autodl-tmp/ddm-nni/MUTAG/5w172ph9/trials/IyyZY'
export NNI_TRIAL_SEQ_ID='0'
export NNI_CODE_DIR='/root/autodl-tmp/ddm-nni/MUTAG'
cd $NNI_CODE_DIR
eval 'python main_graph.py' 1>/root/autodl-tmp/ddm-nni/MUTAG/5w172ph9/trials/IyyZY/stdout 2>/root/autodl-tmp/ddm-nni/MUTAG/5w172ph9/trials/IyyZY/stderr
echo $? `date +%s%3N` >'/root/autodl-tmp/ddm-nni/MUTAG/5w172ph9/trials/IyyZY/.nni/state'