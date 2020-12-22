# MuonCollider-docker
Docker files for Muon Collider software

## Building the images
The incremental images for the framework can be built with the following command:
```
cd CentOS8
docker build -f Dockerfile-environment -t infnpd/mucoll-environment:1.4-centos8 .
docker build -f Dockerfile-ilc-base -t infnpd/mucoll-ilc-base:1.4-centos8 .
docker build -f Dockerfile-ilc-framework -t infnpd/mucoll-ilc-framework:1.4-centos8 .
```

A useful way to test the image is running a shell on the container:
```
docker run -ti --rm --entrypoint /bin/bash infnpd/mucoll-ilc-framework:1.4-centos8
```
and inspect its content.
