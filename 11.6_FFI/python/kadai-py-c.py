#!/usr/bin/env python

import ctypes
fact = ctypes.CDLL('./kadai-py-c.so')

fact.factorial.argtypes = [ctypes.c_int]
fact.factorial.restype = ctypes.c_int

print fact.factorial(5)
print fact.factorial(10)

