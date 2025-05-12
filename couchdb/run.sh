#!/usr/bin/with-contenv bashio

# Get username/password from add-on config
export COUCHDB_USER=$(bashio::config 'username')
export COUCHDB_PASSWORD=$(bashio::config 'password')

exec /opt/couchdb/bin/couchdb
