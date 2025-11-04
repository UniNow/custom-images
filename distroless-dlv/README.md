# distroless-dlv

This repository contains a minimal distroless image with the [Go Delve debugger (dlv)](https://github.com/go-delve/delve). This image provides a secure, minimal debugging environment based on Google's distroless static image compared to traditional base images.

The changes can be viewed inside the `Dockerfile`.

This image is built automatically when a new dlv version is released.

## Usage

You can pull the image by using
```bash
docker pull ghcr.io/uninow/distroless-dlv:VERSION
```
