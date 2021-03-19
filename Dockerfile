FROM tootallnate/bashttpd:latest

RUN apk add --no-cache curl
RUN addgroup -g 1000 -S bashttpd && \
  adduser -u 1000 -S bashttpd -G bashttpd
USER bashttpd

WORKDIR /etc/bashttpd
COPY bashttpd.conf .
COPY telegram.sh .

CMD ["socat", "TCP4-LISTEN:8080,fork,reuseaddr", "EXEC:bashttpd"]
