FROM debian:stable-slim AS builder

RUN apt update && apt upgrade -y && apt install -y curl unzip

WORKDIR /opt
RUN curl -O -sSL https://github.com/balena-io/balena-cli/releases/download/v13.3.1/balena-cli-v13.3.1-linux-x64-standalone.zip
RUN unzip balena-cli-*-linux-x64-standalone.zip
RUN rm -rf balena-cli-*-linux-x64-standalone.zip

FROM debian:stable-slim

COPY --from=builder /opt /opt

RUN ln -s /opt/balena-cli/balena /usr/bin/
COPY entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
