FROM golang:1.6.0 as builder

RUN mkdir -p /go/src/github.com/jamiealquiza/polymur

WORKDIR /go/src/github.com/jamiealquiza/polymur

COPY . /go/src/github.com/jamiealquiza/polymur

RUN go get github.com/jamiealquiza/polymur/...

RUN go install github.com/jamiealquiza/polymur/cmd/polymur-gateway

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o polymur-gateway ./cmd/polymur-gateway/main.go

RUN md5sum polymur-gateway

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

COPY --from=builder /go/src/github.com/jamiealquiza/polymur/polymur-gateway /polymur-gateway

EXPOSE 2003

EXPOSE 2030

EXPOSE 2020

ENTRYPOINT ["/polymur-gateway"]