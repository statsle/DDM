#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File Name:     run_search.py
# Author:        Yizhuo Quan
# Created Time:  2023-03-05  09:38
# Last Modified: <none>-<none>

import json
import signal

file = open('search_space.json', 'r')
# file = open('search_space_v2.json', 'r')
search_space = json.load(file)

from nni.experiment import Experiment
experiment = Experiment('local')

experiment.config.trial_command = 'python main_node.py'
experiment.config.trial_code_directory = '.'
experiment.config.experiment_working_directory = '.'


experiment.config.search_space = search_space
experiment.config.tuner.name = 'TPE'

experiment.config.tuner.class_args['optimize_mode'] = 'maximize'
experiment.config.max_trial_number = 300
experiment.config.trial_concurrency = 1
experiment.run(6006)
signal.pause()
# experiment.stop()
