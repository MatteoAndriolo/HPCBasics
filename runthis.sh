#!/bin/bash
TAG="tag:latest"
TAR="$TAG.tar"
SIF="$TAG.sif"
USERNAME="marinelloe"

docker build -t $TAG -f Dockerfile.2 .
docker save -o $TAR $TAG
singularity build $SIF docker-archive://$TAR
rm $TAR

# Invia file nella home in sysbiobig
# scp $SIF $USERNAME@login.dei.unipd.it:/nfsd/sysbiobig/$USERNAME/$SIF