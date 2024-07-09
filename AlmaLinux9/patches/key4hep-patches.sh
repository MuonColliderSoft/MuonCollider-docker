#!/bin/bash

# Determine what commit of spack we have
cd ${SPACK_ROOT}
SPACK_COMMIT=$(git rev-parse HEAD)

# Determine key4hep supported spack commit
SPACK_COMMIT_KEY4HEP=$(cat ${SPACK_ROOT}/var/key4hep-spack/.latest-commit)

if [ ${SPACK_COMMIT} != ${SPACK_COMMIT_KEY4HEP} ]; then
    echo "Spack version not officially tested by key4hep."
    echo " recommended version: ${SPACK_COMMIT_KEY4HEP}"
    echo " our version: ${SPACK_COMMIT}"
    echo "Ignoring patches..."
    exit 0
fi

# Apply the key4hep patches to spack :shrug:
cd ${SPACK_ROOT}
source ${SPACK_ROOT}/var/key4hep-spack/.cherry-pick
