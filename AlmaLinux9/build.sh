#!/bin/bash
# USAGE: ./build.sh [<version>] [<repository>]

VERSION="devel"
REPOSITORY="infnpd"
SUFFIX="el9"

if [ "$#" -gt 0 ]; then
	VERSION=$1
fi
if [ "$#" -gt 1 ]; then
	REPOSITORY=$2
fi

echo "### Building Docker images: ${REPOSITORY}/<IMAGE>:${VERSION}-${SUFFIX}"
echo
echo "### Building the OS-environment image" && \
docker build -t ${REPOSITORY}/mucoll-environment:${VERSION}-${SUFFIX} --build-arg REPOSITORY --build-arg VERSION --progress=plain - < Dockerfile-environment && \
#
echo "### Building the Spack image" && \
docker build -t ${REPOSITORY}/mucoll-spack:${VERSION}-${SUFFIX} --build-arg REPOSITORY --build-arg VERSION --progress=plain - < Dockerfile-spack && \
#
echo "### Building the MuColl simulation image" && \
tar -ch . | docker build -t ${REPOSITORY}/mucoll-sim:${VERSION}-${SUFFIX} --build-arg REPOSITORY --build-arg VERSION --progress=plain -
