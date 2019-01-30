build:
	docker build -f cmd/polymur/Dockerfile . -t polymur
	docker build -f cmd/polymur-gateway/Dockerfile . -t polymur-gateway
	docker build -f cmd/polymur-proxy/Dockerfile . -t polymur-proxy