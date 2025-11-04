FROM golang:1.25 AS builder

# datasource=github-releases depName=go-delve/delve
ENV DLV_VERSION=v1.25.2

WORKDIR /app

RUN CGO_ENABLED=0 go install -ldflags '-extldflags -static' github.com/go-delve/delve/cmd/dlv@${DLV_VERSION}

FROM gcr.io/distroless/static-debian12

COPY --from=builder /go/bin/dlv /usr/local/bin/dlv

EXPOSE 2345

ENTRYPOINT ["/usr/local/bin/dlv"]
CMD ["--help"]
