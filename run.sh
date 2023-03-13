#!/bin/bash

HOME="/home/sim"

docker run -it \
-v ${PWD}/.bash_profile:${HOME}/.bash_profile \
mucoll-sim:2.0-centos8stream
