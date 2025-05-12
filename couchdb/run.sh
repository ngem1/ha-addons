#!/bin/sh

export COUCHDB_USER=${COUCHDB_USER:-admin}
export COUCHDB_PASSWORD=${COUCHDB_PASSWORD:-changeme}

exec /opt/couchdb/bin/couchdb

if [ ! -f /opt/couchdb/etc/local.ini ]; then
    cp /config/local.ini /opt/couchdb/etc/local.ini
fi
