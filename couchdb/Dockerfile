FROM couchdb:latest

# Add tini for proper subreaper
RUN apt update && apt install -y tini

# Copy and set up the entrypoint script
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/run.sh"]
