#!/usr/local/bin/python3
import atheris
import sys
import pykakasi

kks = pykakasi.kakasi()

@atheris.instrument_func
def TestOneInput(data):
    fdp = atheris.FuzzedDataProvider(data)
    in_string = fdp.ConsumeUnicodeNoSurrogates(len(data))

    kks.convert(in_string)

atheris.instrument_all()
atheris.Setup(sys.argv, TestOneInput)
atheris.Fuzz()
