# Metabase

This repository contains a customized version of [metabase/metabase](https://github.com/metabase/metabase). This image contains [metabase-clickhouse-driver](https://github.com/ClickHouse/metabase-clickhouse-driver) plugin compared to the upstream version.

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new metabase version is released.

## Usage

You can pull the image by using
```bash
docker pull ghcr.io/uninow/metabase:VERSION
```
