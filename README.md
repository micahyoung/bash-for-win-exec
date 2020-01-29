# Experiment to see if bash exec work on BASH for Windows

## Spoiler alert: it doesn't

Windows
```
docker build --tag bash-for-win-exec -f windows.Dockerfile . && docker run --isolation=process bash-for-win-exec C:/msys64/usr/bin/bash.exe C:/test.sh
Sending build context to Docker daemon  2.131MB
Step 1/6 : FROM golang:nanoserver-1809 AS builder
 ---> 4d14fbd515be
Step 2/6 : COPY main.go main.go
 ---> Using cache
 ---> 12b05cd29453
Step 3/6 : RUN go build -o main.exe main.go
 ---> Using cache
 ---> 21ac1819effe
Step 4/6 : FROM stefanscherer/msys2
 ---> 06a9a7938195
Step 5/6 : COPY --from=builder c:/gopath/main.exe main.exe
 ---> Using cache
 ---> 56584fc04dc2
Step 6/6 : COPY test.sh test.sh
 ---> Using cache
 ---> f5e787dfd94c
Successfully built f5e787dfd94c
Successfully tagged bash-for-win-exec:latest
Hello wurld 2176
i am go 1996
```

Linux
```
docker build --tag bash-for-lin-exec -f linux.Dockerfile . && docker run --entrypoint /bin/sh bash-for-lin-exec test.sh
Sending build context to Docker daemon  2.131MB
Step 1/6 : FROM golang:alpine AS builder
 ---> 87eefb76f0a8
Step 2/6 : COPY main.go main.go
 ---> Using cache
 ---> 1442db4ba6e9
Step 3/6 : RUN go build -o main main.go
 ---> Using cache
 ---> d451f278bc09
Step 4/6 : FROM alpine
 ---> 961769676411
Step 5/6 : COPY --from=builder /go/main main
 ---> Using cache
 ---> 0435585a54c5
Step 6/6 : COPY test.sh test.sh
 ---> Using cache
 ---> d7db25b0a0ca
Successfully built d7db25b0a0ca
Successfully tagged bash-for-lin-exec:latest
Hello wurld 1
i am go 1
```
