#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File Name:     setup.py
# Author:        Yang Run
# Created Time:  2022-11-08  00:41
# Last Modified: <none>-<none>

from distutils.core import setup
from Cython.Build import cythonize
import numpy as np

setup(
      ext_modules=cythonize('algos.pyx'),
      include_dirs=[np.get_include()]
)
