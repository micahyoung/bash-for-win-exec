FROM golang:alpine AS builder

COPY main.go main.go

RUN go build -o main main.go

FROM alpine

COPY --from=builder /go/main main

COPY test.sh test.sh
