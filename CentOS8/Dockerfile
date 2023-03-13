###############################################################################
#  Repository: mucoll-sim
#  Tag:        2.0-centos8stream
###############################################################################

FROM mucoll-spack:2.0-centos8stream

# Adding Key4hep repositories
RUN mkdir spack-repos && \
    git clone https://github.com/key4hep/key4hep-spack spack-repos/key4hep-spack

# FIXME: Should replace by a `git clone` in the final version
ADD mucoll-spack spack-repos/mucoll-spack

# Configuring Key4hep environment
ENV SPACK_COLOR="always"
RUN source ~/setenv.sh && \
    spack repo add spack-repos/key4hep-spack && \
    spack env create sim && \
    spack env activate sim && \
    cp spack-repos/mucoll-spack/environments/mucoll-common/packages.yaml $SPACK_ENV/ && \
    echo "spack env activate sim" >> ~/setenv.sh && \
    echo "spack env st" >> ~/setenv.sh && \
    spack spec

# Setting up MuColl stack
RUN source ~/setenv.sh && \
    spack repo add spack-repos/mucoll-spack && \
    spack add mucoll-stack && \
    spack concretize
RUN source ~/setenv.sh && \
    spack install --only-concrete --fail-fast root
RUN source ~/setenv.sh && \
    spack install --only-concrete --fail-fast lcio
RUN source ~/setenv.sh && \
    spack install --only-concrete --fail-fast edm4hep
RUN source ~/setenv.sh && \
    spack install --only-concrete --fail-fast dd4hep

ENTRYPOINT ["/bin/bash", "--login"]

