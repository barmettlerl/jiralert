FROM golang:1.19 AS builder
WORKDIR /go/src/github.com/barmettlerl/jiralert
COPY . /go/src/github.com/barmettlerl/jiralert
RUN GO111MODULE=on GOBIN=/tmp/bin make

FROM quay.io/prometheus/busybox-linux-amd64:latest

COPY --from=builder /go/src/github.com/barmettlerl/jiralert/jiralert /bin/jiralert

ENTRYPOINT [ "/bin/jiralert" ]
