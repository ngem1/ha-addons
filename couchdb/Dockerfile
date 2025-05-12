ARG BUILD_FROM
FROM $BUILD_FROM

# Install CouchDB and tini
RUN apk add --no-cache couchdb tini

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/run.sh"]

LABEL \
  io.hass.version="1.0.0" \
  io.hass.type="addon" \
  io.hass.arch="amd64|aarch64|armv7"
