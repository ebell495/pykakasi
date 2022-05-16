# Use an official Ubuntu as a parent image
FROM python:3.8-bullseye

# set the working directory to /phonemizer
WORKDIR /pykakasi

# install dependencies
# RUN apt-get update && apt-get upgrade -y && apt-get install -y \
#         git \
#         python3 \
#         python3-pip && \
#     apt-get clean

# pytest needs to be installed through pip to make sure we have a recent version
RUN pip3 install atheris

# # tests expect python to be available as executable 'python' not 'python3'
# RUN ln -s /usr/bin/python3 /usr/bin/python

# copy the phonemizer code within the docker image
COPY . /pykakasi

# install phonemizer and run the tests
RUN cd /pykakasi && \
    chmod +x fuzz/fuzz.py && \
    python3 setup.py install
