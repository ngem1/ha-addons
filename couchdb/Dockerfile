ARG BUILD_FROM
FROM $BUILD_FROM

# Install CouchDB
RUN apk add --no-cache couchdb

# Copy the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Let s6-overlay handle init (this will run /run.sh as CMD)
CMD [ "/run.sh" ]

LABEL \
  io.hass.version="1.0.0" \
  io.hass.type="addon" \
  io.hass.arch="amd64|aarch64|armv7"
