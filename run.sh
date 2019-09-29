#!/bin/bash

function dump() {
    echo "$(date) Dumping certificates"

    dumpcerts.sh /traefik/acme.json /traefik/ssl/ && \
    ln -f /traefik/ssl/certs/* /traefik/ssl/ && \
    ln -f /traefik/ssl/private/* /traefik/ssl/; \
}

apk --no-cache add inotify-tools jq openssl util-linux bash && \
wget https://raw.githubusercontent.com/containous/traefik/v1.7/contrib/scripts/dumpcerts.sh -O dumpcerts.sh && \
mkdir -p /traefik/ssl/ && \
dump

while true; do
    inotifywait -qq -e modify /traefik/acme.json
    dump
done
