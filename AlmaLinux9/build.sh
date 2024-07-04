#!/bin/bash
# USAGE: ./build.sh [<version>] [<repository>]

VERSION="release"
REPOSITORY="infnpd"
SUFFIX="alma9"

if [ "$#" -gt 0 ]; then
	VERSION=$1
fi
if [ "$#" -gt 1 ]; then
	REPOSITORY=$2
fi
if [[ -z "${DOCKER}" ]]; then
    DOCKER="docker"
fi

# exit when any command fails
set -e

# The actual building
echo "### Building Docker images: ${REPOSITORY}/<IMAGE>:${VERSION}-${SUFFIX}"
echo
#
echo "### Building the Spack image" && \
${DOCKER} build -t ${REPOSITORY}/mucoll-spack:${VERSION}-${SUFFIX} --build-arg REPOSITORY --build-arg VERSION --progress=plain - < Dockerfile-spack
#
echo "### Building the MuColl simulation image"
${DOCKER} build -t ${REPOSITORY}/mucoll-sim:${VERSION}-${SUFFIX} --build-arg REPOSITORY --build-arg VERSION --progress=plain - < Dockerfile-sim
