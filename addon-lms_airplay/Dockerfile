FROM ghcr.io/home-assistant/amd64-base-debian:bullseye

RUN apt-get update && \
    apt-get install -y git build-essential libconfig++-dev curl && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/philippe44/LMS-to-AirPlay.git /app && \
    cd /app && \
    make

WORKDIR /app

EXPOSE 49152

CMD ["/app/bin/raop-bridge", "-f", "/app/raop-bridge.xml"]
