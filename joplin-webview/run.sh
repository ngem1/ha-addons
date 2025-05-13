#!/usr/bin/with-contenv bash
# shellcheck shell=bash

echo "[INFO] Starting Joplin Vieweb..."

# Navigate to application directory
cd /app || exit 1

# Apply migrations and start server
python manage.py migrate
python manage.py runserver 0.0.0.0:8080


