FROM alpine:latest

RUN apk --no-cache add inotify-tools jq openssl util-linux bash; \
    wget https://raw.githubusercontent.com/containous/traefik/v1.7/contrib/scripts/dumpcerts.sh -O dumpcerts.sh;

COPY run.sh /

ENTRYPOINT ["/run.sh"]
