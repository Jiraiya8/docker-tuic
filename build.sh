docker buildx build --push --platform linux/amd64,linux/arm64 --tag liyuanbiao/tuic-server:$1 --tag liyuanbiao/tuic-server:latest --build-arg TUIC_VERSION=$1 .
