# How to use this image

## Create a standing container
`podman run -it -v $(pwd):/tmp/workdir:Z --entrypoint /bin/bash ghcr.io/deb4sh/docker-azure-cli:0.0.0 `

## Simply run a command
`podman run -it -v $(pwd):/tmp/workdir:Z /bin/bash ghcr.io/deb4sh/docker-azure-cli:0.0.0 version`