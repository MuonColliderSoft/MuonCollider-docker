#!/bin/bash

PATCHDIR=$(dirname -- "${BASH_SOURCE[0]}")
PATCHDIR=$(realpath ${PATCHDIR})

cd ${SPACK_ROOT}

for PATCH in $PATCHDIR/*.patch;
do
    echo "Applying $(basename ${PATCH})"
    patch ${PATCH}
done