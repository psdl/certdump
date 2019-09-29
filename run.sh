#!/bin/bash

function dump() {
    echo "$(date) Dumping certificates"
    
    cd /
    dumpcerts.sh /traefik/acme.json /traefik/ssl/
    ln -f /traefik/ssl/certs/* /traefik/ssl/
    ln -f /traefik/ssl/private/* /traefik/ssl/
}

mkdir -p /traefik/ssl/
dump

while true; do
    inotifywait -qq -e modify /traefik/acme.json
    dump
done
