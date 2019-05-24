# Linux Base Container for C2PAP using Intel MPI

This repository contains the files necessary to generate a CentOS-7 based Docker image that contains a basic software stack developing Julia code with MPI on c2pap.

The Docker image includes the following Software:

* Anaconda v2018.12 (Python 3.7)
* GitHub Atom v1.34
* CERN ROOT v6.14
* HDF5 (thread-safe build)
* Julia v1.1
* Node.js
* Intel MPI 2018.3.222

If rebuilding, one needs to download and put the Intel MPI tar file in `provisioning/install-sw-scripts/`, for example `provisioning/install-sw-scripts/l_mpi_2018.3.222.tgz`.


## Use with [NERSC Shifter](https://docs.nersc.gov/development/shifter/how-to-use/)


Pull the image via

    shifterimg pull docker:legendexp/legend-base:latest

Then try running an interactive session via

    shifter --image docker:legendexp/legend-base:latest -- /bin/bash


## Use with [Singularity](https://www.sylabs.io/singularity/) (changing the container name appropriately)


With Singularity v2.x, convert the Docker image to a Singularity image via

    sudo singularity build legend-base.sqsh docker://legendexp/legend-base:latest

With Singularity v3.x, you'll probably want to use the new SIF container format:

    sudo singularity build legend-base.sif docker://legendexp/legend-base:latest

The resulting Singularity image file is quite large. On shared computing environments, the image file is best placed on a shared network/cluster file system (not in your home directory).

Afterwards, try running an interactive session via

    singularity shell /path/to/legend-base.[sqsh|sif]

On systems with NVIDIA GPUs, use

    singularity shell --nv /path/to/legend-base.[sqsh|sif]

to make the NVIDIA driver available within the container instance (the command `nvidia-smi` should then become available in the container instance as well.)


## Use with Docker

If you have sufficient privileges on your local system to install and use Docker, you can also run the Docker image directly:

```shell
docker pull legendexp/legend-base:latest
docker run -it --name mylegendinstance legendexp/legend-base:latest
```

You will probably want to use additional `docker run` options like `-p 8888:8888` and `-v /home/dir:/home/dir`. You may want to familiarize yourself with Docker first.


### Installing Docker

* On Linux: Install the [Docker Community Edition (CE)](https://docs.docker.com/install/)
* On OS-X: Install [Docker for Mac](https://docs.docker.com/docker-for-mac/)
* On Windows: Install [Docker for Windows](https://docs.docker.com/docker-for-windows/)

On OS-X and Windows, Docker will runs container instances in a lightweight virtual Linux system (this is mostly transparent to the user). Likewise, the container instance itself is always a Linux system, independent of the system's native OS.
