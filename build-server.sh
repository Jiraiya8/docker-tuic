docker buildx build --push --platform linux/amd64,linux/amd64/v3,linux/arm64 --tag liyuanbiao/tuic-server:latest -f ./Dockerfile-server .
