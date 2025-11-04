# custom-images

This mono repo includes custom docker images which are built to include custom extra components. Here is a quick overview of the software:

## Images

- [argocd](argocd) - A tool for GitOps and CD for Kubernetes with sops and helm-secrets plugin
- [distroless-dlv](distroless-dlv) - A minimal distroless image containing the Go Delve debugger
- [metabase](metabase) - Metabase analytics platform with ClickHouse driver plugin
- [pwpush](pwpush) - Password Pusher service with custom UniNow patches

## Usage

You can pull an image by using
```bash
docker pull ghcr.io/uninow/SOFTWARE:VERSION
```
