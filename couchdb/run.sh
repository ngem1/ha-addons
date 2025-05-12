#!/usr/bin/with-contenv bashio

USERNAME=$(bashio::config 'username')
PASSWORD=$(bashio::config 'password')

echo "Creating CouchDB admin config"
mkdir -p /opt/couchdb/etc/local.d

cat <<EOF > /opt/couchdb/etc/local.d/admin.ini
[admins]
$USERNAME = $PASSWORD
EOF

exec /opt/couchdb/bin/couchdb
