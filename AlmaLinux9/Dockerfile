###############################################################################
#  Repository: ${REPOSITORY}/mucoll-sim
#  Tag:        ${VERSION}-el9
###############################################################################

ARG VERSION=devel
ARG REPOSITORY=infnpd
FROM ${REPOSITORY}/mucoll-spack:${VERSION}-el9

# Adding Key4hep repositories
RUN mkdir spack-repos
RUN git clone https://github.com/key4hep/key4hep-spack spack-repos/key4hep-spack && \
    git clone https://github.com/MuonColliderSoft/mucoll-spack spack-repos/mucoll-spack
# FIXME: Using `ADD` for debugging. Should use `RUN git clone ...` in production
# ADD key4hep-spack spack-repos/key4hep-spack
# ADD mucoll-spack spack-repos/mucoll-spack

# Configuring Key4hep environment
RUN source /setup_spack.sh && \
    spack repo add --scope system spack-repos/key4hep-spack && \
    spack repo add --scope system spack-repos/mucoll-spack && \
    spack env create sim && \
    spack env activate sim && \
    cp spack-repos/mucoll-spack/environments/mucoll-release/*.yaml $SPACK_ENV && \
    cat /setup_spack.sh > ${HOME}/setup_env.sh && \
    echo "spack env activate sim" >> ${HOME}/setup_env.sh && \
    echo "spack env status" >> ${HOME}/setup_env.sh

# Concretizing the MuColl stack reusing system packages as external
RUN source ${HOME}/setup_env.sh && \
    spack add mucoll-stack && \
    spack concretize --reuse

# Installing fragments of dependency tree in separate layers for cached debugging
ENV SPACK_INSTALL_OPTS "--only-concrete --no-add --fail-fast"

RUN source ${HOME}/setup_env.sh && \
    spack spec -NIt lcio && \
    spack install ${SPACK_INSTALL_OPTS} root && \
    spack clean -a
RUN source ${HOME}/setup_env.sh && \
    spack spec -NIt dd4hep && \
    spack install ${SPACK_INSTALL_OPTS} dd4hep && \
    spack clean -a
RUN source ${HOME}/setup_env.sh && \
    spack spec -NIt && \
    spack install ${SPACK_INSTALL_OPTS} && \
    spack clean -a

RUN source ${HOME}/setup_env.sh && \
    echo "source ${MUCOLL_STACK}" > /setup_mucoll.sh

# Setting up users to be used for the local environment setup
RUN useradd --shell /bin/bash --create-home mucoll
USER mucoll
WORKDIR /home/mucoll

ENTRYPOINT ["/bin/bash", "--login"]

