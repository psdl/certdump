FROM alpine:latest

RUN apk --no-cache add inotify-tools jq openssl util-linux bash

COPY run.sh /

ENTRYPOINT ["/run.sh"]
