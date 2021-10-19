FROM golang:alpine as builder
WORKDIR /app
COPY . .
RUN  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/rezex .

FROM scratch
VOLUME /tmp
VOLUME /data
WORKDIR /root/
COPY --from=builder /go/bin/rezex /go/bin/rezex
COPY commit.id commit.id
EXPOSE 8080
ENTRYPOINT ["/go/bin/rezex"]


