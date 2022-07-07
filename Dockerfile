FROM python:3.8-bullseye

# set the working directory to /pykakasi
WORKDIR /pykakasi

RUN pip3 install atheris

COPY . /pykakasi

# install pykakasi
RUN cd /pykakasi && \
    chmod +x fuzz/transliterate-fuzz.py && \
    python3 setup.py install
