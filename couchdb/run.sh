#!/usr/bin/with-contenv bashio

USERNAME=$(bashio::config 'username')
PASSWORD=$(bashio::config 'password')

echo "Setting CouchDB admin user in /opt/couchdb/etc/local.d/admin.ini"

cat <<EOF > /opt/couchdb/etc/local.d/admin.ini
[admins]
$USERNAME = $PASSWORD
EOF

exec /opt/couchdb/bin/couchdb
