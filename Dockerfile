FROM alpine:latest

COPY run.sh /

RUN apk --no-cache add inotify-tools jq openssl util-linux bash; \
    wget https://raw.githubusercontent.com/containous/traefik/v1.7/contrib/scripts/dumpcerts.sh -O dumpcerts.sh; \
    chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
