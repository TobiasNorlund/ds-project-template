# Data Science Project Repository Template

This repo constitutes a skeleton for a typical ML/DS project. Docker is a first class citizen and can be customized by editing the provided `Dockerfile`.

When starting a new project, please do the following:

1. On GitHub, create your own repository from this template by clicking the "Use this template" button
2. Update `DOCKER_IMAGE_NAME` in `scripts/common.sh`
3. Build docker image:
```bash
./scripts/build.sh
```
4. Create and start a docker container:
```bash
./scripts/run.sh [gpu] [notebook] [tensorboard]
```
5. (Optionally) Attach to running container using Visual Studio Code
   - In VS Code, install the `Remote-Containers` extention
   - Run `Remote-Containers: Attach to Running Container...` (F1). Select the newly created container
   - In the Explorer pane, click `Open Folder` and type the workspace directory (by default mounted to `/workspace`)
   - Start hacking!