#!/usr/bin/with-contenv bash
# shellcheck shell=bash

echo "[INFO] Starting Joplin Vieweb..."

cd /app || exit 1

# Export environment variables expected by Django (optional)
export ORIGINS="${ORIGINS:-'*'}"
export JOPLIN_LOGIN_REQUIRED="${JOPLIN_LOGIN_REQUIRED:-True}"

# Apply DB migrations (SQLite-based)
python manage.py migrate

# Start server
exec python manage.py runserver 0.0.0.0:8080