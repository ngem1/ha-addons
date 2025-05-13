#!/bin/sh
set -e

# Substitute placeholders in the settings file:
sed -i "s|JOPLIN_URL_PLACEHOLDER|${JOPLIN_URL}|g" /root/.config/joplin-vieweb/settings.py
sed -i "s|JOPLIN_TOKEN_PLACEHOLDER|${JOPLIN_TOKEN}|g" /root/.config/joplin-vieweb/settings.py
sed -i "s|ORIGINS_PLACEHOLDER|${ORIGINS}|g" /root/.config/joplin-vieweb/settings.py

# Hand off to the upstream launch script
exec /joplin/runserver.sh
