# MuonCollider-docker
Docker files for Muon Collider software

## Building the images
The incremental images for the framework can be built with the following command:

```shell
cd AlmaLinux8
./build.sh
```

The build script will create images under the `infnpd` repository and the
`devel` tag.

Three images are created in sucession:
- `infnpd/mucoll-environment:devel-alma9`: Base OS with developement tools and any other needed system packages.
- `infnpd/mucoll-spack:devel-alma9`: Contains an installation of Spack under `/opt/spack`.
- `infnpd/mucoll-sim:devel-alma9`: Contains the Muon Collider software stack as a Spack environment.

## Running the images

A container can be started with the following command.

```shell
docker run -ti --rm --entrypoint /bin/bash infnpd/mucoll-sim:devel-alma9
```

Two aliases are available for loading the environment setup scripts:
- `setup_spack`: Load the Spack for custom environments.
- `setup_mucoll`: Load the Spack and setup the Muon Collider view.
