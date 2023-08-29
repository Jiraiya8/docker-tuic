ARG TUIC_VERSION=1.0.0

FROM rust:1.72-bookworm as builder

ARG TUIC_VERSION

RUN apt update \
  && apt install wget -y \
  && wget https://github.com/EAimTY/tuic/archive/refs/tags/tuic-server-${TUIC_VERSION}.tar.gz -O tuic-server-${TUIC_VERSION}.tar.gz \
  && tar -zxvf tuic-server-${TUIC_VERSION}.tar.gz

WORKDIR /tuic-tuic-server-${TUIC_VERSION}

RUN cargo build --release

FROM debian:bookworm

ARG TUIC_VERSION
COPY --from=builder /tuic-tuic-server-${TUIC_VERSION}/target/release/tuic-server /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/tuic-server"]

CMD ["--help"]
