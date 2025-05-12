FROM couchdb:latest

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

ENV TINI_SUBREAPER=1
ENTRYPOINT ["/usr/bin/tini", "-s", "--"]
CMD ["/usr/local/bin/run.sh"]
