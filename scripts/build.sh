#!/bin/bash

SCRIPTS_DIR="$(dirname "$0")"
source "$SCRIPTS_DIR/common.sh"

docker build --rm -t $DOCKER_IMAGE_NAME .