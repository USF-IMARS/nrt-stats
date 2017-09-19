#!/usr/bin/env python

"""
script to estimate time between granule observation and product publish

give it a file path and get back # of seconds between granule 
observation (parsed from filename) and product publication (from 
mtime)
"""

import os
import sys

# === backport total_seconds for py < 2.7

import ctypes as c

_get_dict = c.pythonapi._PyObject_GetDictPtr
_get_dict.restype = c.POINTER(c.py_object)
_get_dict.argtypes = [c.py_object]

import datetime

def millisecond(td):
    return (td.microsecond / 1000)
d = _get_dict(datetime.datetime)[0]
d['millisecond'] = millisecond

from datetime import timedelta
try:
    timedelta.total_seconds # new in 2.7
except AttributeError:
    def total_seconds(td):
        return float(td.days * 24 * 3600 + td.seconds + td.microseconds / 1e6)
    d = _get_dict(timedelta)[0]
    d['total_seconds'] = total_seconds


# === okay, now do the actual task

filepath = sys.argv[1] 

# get granule time
dstr = filepath.split("/")[-1][22:31]
observe_time = datetime.datetime.strptime(dstr, "%y%j%H%M")

#datetime.datetime(2017, 9, 14, 18, 35)

# get publish time
pub_time = datetime.datetime.fromtimestamp( os.path.getmtime(filepath) )

print( int((pub_time - observe_time).total_seconds()) )

