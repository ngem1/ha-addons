FROM couchdb:latest

RUN apt update && apt install -y tini

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/run.sh"]
