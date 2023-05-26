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
- `infnpd/mucoll-environment:devel-el9`: Base OS with developement tools and any other needed system packages.
- `infnpd/mucoll-spack:devel-el9`: Contains an installation of Spack under `/opt/spack`.
- `infnpd/mucoll-sim:devel-el9`: Contains the Muon Collider software stack as a Spack environment.

## Running the images

A container can be started with the following command.

```shell
docker run -ti --rm --entrypoint /bin/bash infnpd/mucoll-sim:devel-el9
```

Two setup scripts are available for loading the environment:
- `source /setup_spack.sh`: Load the Spack for custom environments.
- `source /setup_mucoll.sh`: Load the Spack and setup the Muon Collider view.
