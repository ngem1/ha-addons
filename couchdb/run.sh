#!/usr/bin/with-contenv bashio

export COUCHDB_USER=$(bashio::config 'username')
export COUCHDB_PASSWORD=$(bashio::config 'password')

exec /opt/couchdb/bin/couchdb
