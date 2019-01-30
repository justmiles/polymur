FROM golang:1.6.0 as builder

RUN mkdir -p /go/src/github.com/jamiealquiza/polymur

WORKDIR /go/src/github.com/jamiealquiza/polymur

COPY . /go/src/github.com/jamiealquiza/polymur

RUN go get github.com/jamiealquiza/polymur/...

RUN go install github.com/jamiealquiza/polymur/cmd/polymur-proxy

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o polymur-proxy ./cmd/polymur-proxy/main.go

RUN md5sum polymur-proxy

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

COPY --from=builder /go/src/github.com/jamiealquiza/polymur/polymur-proxy /polymur-proxy

EXPOSE 2003

EXPOSE 2030

EXPOSE 2020

ENTRYPOINT ["/polymur-proxy"]