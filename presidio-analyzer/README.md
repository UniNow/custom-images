# presidio-analyzer

This repository contains a customized version of [Microsoft/presidio](https://github.com/microsoft/presidio). This image contains some customizations (see `presidio-analyzer.patch`) compared to the upstream version.

The changes can be viewed inside the `presidio-analyzer.patch` file.

This image is built automatically when a new presidio version is released.

## Usage

You can pull the image by using
```bash
docker pull ghcr.io/uninow/presidio-analyzer:VERSION
```

## How to update the patch file

1. Make your changes to the presidio submodule

2. Generate a new patch file from the changes:
   ```bash
   cd presidio
   git diff > ../presidio-analyzer.patch
   ```
