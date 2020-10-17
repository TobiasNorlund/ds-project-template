#!/bin/bash

# Docker image name for this project
export DOCKER_IMAGE_NAME="tobias/default"

# Path to where in the docker container the project root will be mounted
export DOCKER_WORKSPACE_PATH="/workspace"

# Path to project root dir (independent of pwd)
export PROJECT_ROOT=$( cd $(dirname $( dirname "${BASH_SOURCE[0]}") ); pwd )

# Path to data dir
export DATA_DIR="$PROJECT_ROOT/data"
