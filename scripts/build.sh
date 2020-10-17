#!/bin/bash

SCRIPTS_DIR="$(dirname "$0")"
source "$SCRIPTS_DIR/common.sh"

docker build --rm --build-arg DOCKER_WORKSPACE_PATH -t $DOCKER_IMAGE_NAME $PROJECT_ROOT