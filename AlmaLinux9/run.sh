#!/bin/bash

HOME="/home/sim"

docker run -it \
-v ../.bash_profile:${HOME}/.bash_profile \
infnpd/mucoll-sim:2.0-alma9

