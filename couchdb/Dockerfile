ARG BUILD_FROM
FROM $BUILD_FROM

# Install CouchDB
RUN apk add --no-cache couchdb

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
