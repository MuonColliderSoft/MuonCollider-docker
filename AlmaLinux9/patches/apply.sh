#!/bin/bash

PATCHDIR=$(dirname -- "${BASH_SOURCE[0]}")
PATCHDIR=$(realpath ${PATCHDIR})

for PATCH in $PATCHDIR/*.patch;
do
    echo "Applying $(basename ${PATCH})"
    pushd ${SPACK_ROOT}
    patch ${PATCH}
    popd
done