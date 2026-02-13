FROM golang:1.26 AS builder

# datasource=github-releases depName=go-delve/delve
ENV DLV_VERSION=v1.26.0

WORKDIR /app

RUN CGO_ENABLED=0 go install -ldflags '-extldflags -static' github.com/go-delve/delve/cmd/dlv@${DLV_VERSION}

FROM busybox:1.37.0-uclibc AS busybox

FROM gcr.io/distroless/static-debian12

COPY --from=busybox /bin/sh /bin/chmod /bin/touch /bin/tar /bin/date /bin/

COPY --from=builder /go/bin/dlv /usr/local/bin/dlv

COPY entrypoint.sh /entrypoint.sh

EXPOSE 2345

ENTRYPOINT ["/entrypoint.sh"]
