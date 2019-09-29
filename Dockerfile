FROM alpine:latest
RUN ash -c " \
      apk --no-cache add inotify-tools jq openssl util-linux bash && \
      wget https://raw.githubusercontent.com/containous/traefik/v1.7/contrib/scripts/dumpcerts.sh && \
      mkdir -p /traefik/ssl/ && \
      while true; do \
        inotifywait -e modify /traefik/acme.json && \
        bash dumpcerts.sh /traefik/acme.json /traefik/ssl/ && \
        ln -f /traefik/ssl/certs/* /traefik/ssl/ && \
        ln -f /traefik/ssl/private/* /traefik/ssl/; \
      done"
