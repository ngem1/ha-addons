FROM couchdb:latest

# Add tini to act as PID 1 (fixes zombie warning)
RUN apt update && apt install -y tini

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/run.sh"]
