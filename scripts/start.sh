#!/bin/bash

# Docker image name for this project
DOCKER_IMAGE_NAME="tobias/default"

# Path to where in the docker container the project root will be mounted
DOCKER_WORKSPACE_PATH="/workspace"

# Path to repo/project root dir (independent of pwd)
PROJECT_ROOT=$( cd $(dirname $( dirname "${BASH_SOURCE[0]}") ); pwd )

# Path to data dir
DATA_DIR="$PROJECT_ROOT/data"


for arg in "$@"
do
    if [ $arg == "gpu" ]; then
      RUNTIME_ARGS="--gpus all"
    elif [ $arg == "notebook" ]; then
      JUPYTER_PORT="-p 8888:8888"
    elif [ $arg == "tensorboard" ]; then
      TENSORBOARD_PORT="-p 6006:6006"
    else
      echo "Unrecognized argument '$arg'"
      exit 1
    fi
done

USER_MAP="-u $(id -u):$(id -g)"
CONTAINER_NAME=${DOCKER_IMAGE_NAME##*/}

set -x
docker build --rm --build-arg DOCKER_WORKSPACE_PATH -t $DOCKER_IMAGE_NAME $PROJECT_ROOT
docker run --rm -it \
  --name $CONTAINER_NAME \
  -v /tmp:/tmp \
  -v $PROJECT_ROOT:$DOCKER_WORKSPACE_PATH \
  $USER_MAP \
  $RUNTIME_ARGS \
  $JUPYTER_PORT \
  $TENSORBOARD_PORT \
  $DOCKER_IMAGE_NAME bash
