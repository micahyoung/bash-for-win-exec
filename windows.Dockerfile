FROM golang:nanoserver-1809 AS builder

COPY main.go main.go

RUN go build -o main.exe main.go

FROM stefanscherer/msys2

COPY --from=builder c:/gopath/main.exe main.exe

COPY test.sh test.sh
