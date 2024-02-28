# syntax=docker/dockerfile:1.6.0
FROM alpine:3.18

ARG TARGETOS=linux
ARG TARGETARCH

RUN apk add --no-cache bash curl git make go

# Install OpenAPI linter
RUN curl -fsSL https://quobix.com/scripts/install_vacuum.sh | sh

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# Install OpenAPI go generator
RUN go install github.com/deepmap/oapi-codegen/v2/cmd/oapi-codegen@v2.0.0

WORKDIR $GOPATH
