#!/usr/local/bin/python3
import atheris
import sys
import pykakasi

@atheris.instrument_func
def TestOneInput(data):
    kks = pykakasi.kakasi()
    try:
        st = data.decode("utf-8")
    except UnicodeDecodeError:
        return
    kks.convert(st)

atheris.instrument_all()
atheris.Setup(sys.argv, TestOneInput)
atheris.Fuzz()
