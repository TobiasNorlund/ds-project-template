#!/bin/bash

SCRIPTS_DIR="$(dirname "$0")"
source "$SCRIPTS_DIR/common.sh"

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

set -x
docker run --rm -it \
  -v $PROJECT_ROOT:$DOCKER_WORKSPACE_PATH \
  -v /tmp:/tmp \
  $USER_MAP \
  $RUNTIME_ARGS \
  $JUPYTER_PORT \
  $TENSORBOARD_PORT \
  $DOCKER_IMAGE_NAME bash
