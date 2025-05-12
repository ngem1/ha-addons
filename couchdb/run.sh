#!/bin/sh

export COUCHDB_USER=${COUCHDB_USER:-admin}
export COUCHDB_PASSWORD=${COUCHDB_PASSWORD:-changeme}

exec /opt/couchdb/bin/couchdb
