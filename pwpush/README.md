# pwpush

This repository contains a customized version of [pglombardo/pwpush](https://hub.docker.com/r/pglombardo/pwpush) ([GitHub](https://github.com/pglombardo/PasswordPusher)). This image contains some customizations (see `uninow.patch`) compared to the upstream version.

This image is built automatically when a new synapse version is released.

## Usage

You can pull the image by using
```bash
docker pull ghcr.io/uninow/pwpush:VERSION
```

## How to update the patch file

1. Go to the diff page between the [branches](https://github.com/pglombardo/PasswordPusher/compare/master...UniNow:PasswordPusher:master.diff)

2. Copy the diff content and update the `uninow.patch` file
