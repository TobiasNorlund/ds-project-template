# Data Science Project Repository Template

This repo constitutes a skeleton for a typical ML/DS project. Docker is a first class citizen and can be customized by editing the provided `Dockerfile`.

When starting a new project, please do the following:

1. On GitHub, create your own repository from this template by clicking the "Use this template" button
2. Update `DOCKER_IMAGE_NAME` in `start.sh`. Also set "name" in `.devcontainer/devcontainer.json` to the same name.
3. In `.devcontainer/devcontainer.json`, update the `source=tobias-default-home` to the same name (but with dashes instead of slashes + "-home"). This is for the same home volume to be used whether or not the container is started with `start.sh` script or VS Code. 

The devcontainer can either be started in a terminal, using the `start.sh` script:
```bash
./start.sh [--gpu] [-v|--mount /host/path:/container/path] [--detach]
```
Or using the `Dev Containers` extension to VS Code. 
   - Run `Remote-Containers: Reopen in container` (F1).
