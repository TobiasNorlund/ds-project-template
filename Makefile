.DEFAULT_GOAL := build

# TODO: Change project name
DOCKER_IMAGE_BASE_NAME:=tobias/default
DATA_DIR:=$(CURDIR)/data

GPU_TAG := 2.0.0b0-gpu-py3
CPU_TAG := 2.0.0b0-py3


# --- BUILD -----------------------

.PHONY: build-cpu
build-cpu:
	docker build --rm -t $(DOCKER_IMAGE_BASE_NAME)-cpu --build-arg TAG=$(CPU_TAG) .

.PHONY: build-gpu
build-gpu:
	docker build --rm -t $(DOCKER_IMAGE_BASE_NAME)-gpu --build-arg TAG=$(GPU_TAG) .

build: build-cpu build-gpu

# -- RUN --------------------------

.PHONY: run-cpu
run-cpu:
	docker run --rm -it -v $(CURDIR):/opt/project -v $(DATA_DIR):/data -v /tmp:/tmp $(DOCKER_IMAGE_BASE_NAME)-cpu bash

.PHONY: run-gpu
run-gpu:
	docker run --rm -it --runtime nvidia -v $(CURDIR):/opt/project -v $(DATA_DIR):/data -v /tmp:/tmp $(DOCKER_IMAGE_BASE_NAME)-gpu bash

.PHONY: run-notebook
run-notebook:
	docker run --rm -it -v $(CURDIR):/opt/project -v $(DATA_DIR):/data -v /tmp:/tmp -p 8888:8888 -w /opt/project/notebooks $(DOCKER_IMAGE_BASE_NAME)-cpu jupyter notebook --ip 0.0.0.0 --allow-root

.PHONY: tensorboard
run-tensorboard:
	docker run --rm -it -v $(CURDIR):/opt/project -v $(DATA_DIR):/data -v /tmp:/tmp -p 6006:6006 $(DOCKER_IMAGE_BASE_NAME)-cpu bash