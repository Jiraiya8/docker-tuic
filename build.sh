docker buildx build --push --platform linux/amd64,linux/amd64/v3,linux/arm64 --tag liyuanbiao/tuic:$1 --tag liyuanbiao/tuic:latest --build-arg TUIC_VERSION=$1 .
