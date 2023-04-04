#!/bin/bash

HOME="/home/sim"

docker run -it \
-v ${PWD}/.bash_profile:${HOME}/.bash_profile \
mucoll-sim:2.0-cs8stream

