FROM debian:stable-slim AS builder

RUN apt update && apt upgrade -y && apt install -y curl jq unzip

WORKDIR /opt

RUN curl -sOL $(curl -s https://api.github.com/repos/balena-io/balena-cli/releases/latest | \
    jq -r -c '.assets | .[] | select(.browser_download_url | contains("linux")) | .browser_download_url') \

RUN unzip balena-cli-*-linux-x64-standalone.zip
RUN rm -rf balena-cli-*-linux-x64-standalone.zip

FROM debian:stable-slim

COPY --from=builder /opt /opt

RUN ln -s /opt/balena-cli/balena /usr/bin/
COPY entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
