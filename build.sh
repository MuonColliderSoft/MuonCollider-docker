#!/bin/bash

cd CentOS8

echo "### Building the OS-environment image"
docker build -t mucoll-environment:2.0-cs8stream --progress=plain - < Dockerfile-environment

echo "### Building the Spack image"
docker build -t mucoll-spack:2.0-cs8stream --progress=plain - < Dockerfile-spack

echo "### Building the MuColl simulation image"
tar -ch . | docker build -t mucoll-sim:2.0-cs8stream --progress=plain -
