###############################################################################
#  Repository: mucoll-sim
#  Tag:        2.0-el9
###############################################################################

FROM mucoll-spack:2.0-el9

# Adding Key4hep repositories
RUN mkdir spack-repos
RUN git clone https://github.com/key4hep/key4hep-spack spack-repos/key4hep-spack && \
    git clone https://github.com/MuonColliderSoft/mucoll-spack spack-repos/mucoll-spack
# FIXME: Using `ADD` for debugging. Should use `RUN git clone ...` in production
# ADD key4hep-spack spack-repos/key4hep-spack
# ADD mucoll-spack spack-repos/mucoll-spack

# Configuring Key4hep environment
ENV SPACK_ENV_DIR "spack-repos/mucoll-spack/environments/mucoll-release/"
RUN source ~/setenv.sh && \
    spack repo add spack-repos/key4hep-spack && \
    spack repo add spack-repos/mucoll-spack && \
    spack env create sim && \
    spack env activate sim && \
    cp spack-repos/mucoll-spack/environments/mucoll-release/*.yaml $SPACK_ENV && \
    echo "spack env activate sim" >> ~/setenv.sh && \
    echo "spack env st" >> ~/setenv.sh

# Concretizing the MuColl stack reusing system packages as external
RUN source ~/setenv.sh && \
    spack add mucoll-stack && \
    spack concretize --reuse

# Installing fragments of dependency tree in separate layers for cached debugging
ENV SPACK_INSTALL_OPTS "--only-concrete --no-add --fail-fast"
RUN source ~/setenv.sh && \
    spack spec -NIt lcio && \
    spack install ${SPACK_INSTALL_OPTS} lcio && \
    spack clean -a
# RUN source ~/setenv.sh && \
#     spack spec -NIt root && \
#     spack install ${SPACK_INSTALL_OPTS} root && \
#     spack clean -a
# RUN source ~/setenv.sh && \
#     spack spec -NIt edm4hep && \
#     spack install ${SPACK_INSTALL_OPTS} edm4hep && \
#     spack clean -a
# RUN source ~/setenv.sh && \
#     spack spec -NIt dd4hep && \
#     spack install ${SPACK_INSTALL_OPTS} dd4hep && \
#     spack clean -a
# RUN source ~/setenv.sh && \
#     spack spec -NIt && \
#     spack install ${SPACK_INSTALL_OPTS} && \
#     spack clean -a

ENTRYPOINT ["/bin/bash", "--login"]

