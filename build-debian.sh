docker buildx build --push --platform linux/amd64,linux/arm64 --tag liyuanbiao/tuic-server:${1}-debian --tag liyuanbiao/tuic-server:latest-debian --build-arg TUIC_VERSION=$1 -f Dockerfile-debian .
