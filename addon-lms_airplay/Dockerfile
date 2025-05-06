FROM ghcr.io/hassio-addons/base:14.2.1

RUN apk add --no-cache git build-base

RUN git clone https://github.com/philippe44/LMS-to-AirPlay.git /app && \
    cd /app && \
    make

WORKDIR /app

EXPOSE 49152

CMD ["/app/bin/raop-bridge", "-f", "/app/raop-bridge.xml"]
