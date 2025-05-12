ARG BUILD_FROM
FROM $BUILD_FROM

# Needed to run tini for PID 1 and handle zombies
RUN apk add --no-cache tini

# Add script and make it executable
COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/run.sh"]

LABEL \
  io.hass.version="1.0.0" \
  io.hass.type="addon" \
  io.hass.arch="amd64|aarch64|armv7"
