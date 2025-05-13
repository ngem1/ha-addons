##############################################
#  Home-Assistant add-on – Joplin-Vieweb
##############################################

# 1. Use a slim Python base; Alpine is fine too, but
#    HA builds on Debian-slim very reliably.
FROM python:3.11-slim

# ------------------------------------------------
# 2. Install build/runtime dependencies
# ------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git build-essential libpq-dev curl python3-pip nginx && \
    curl -sSf https://sh.rustup.rs | sh -s -- -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:${PATH}"

# ------------------------------------------------
# 3. Clone the real backend repo
# ------------------------------------------------
WORKDIR /app
RUN git clone https://github.com/joplin-vieweb/django-joplin-vieweb.git /joplin

# ------------------------------------------------
# 4. Make sure Django looks in the right place
# ------------------------------------------------
ENV DJANGO_SETTINGS_MODULE=server.settings

# ------------------------------------------------
# 5. Pre-create the config dir so cp/sed never fail
# ------------------------------------------------
RUN mkdir -p /root/.config/joplin-vieweb \
 && cp /joplin/server/default_settings.py /root/.config/joplin-vieweb/settings.py

# ------------------------------------------------
# 6. Install Python dependencies
# ------------------------------------------------
RUN pip install --no-cache-dir -r /joplin/requirements.txt

# ------------------------------------------------
# 7. Use the project’s own launch script
# ------------------------------------------------
WORKDIR /joplin
RUN chmod +x runserver.sh

# Upstream script starts Nginx on port 80 and Daphne on 8001
EXPOSE 80

CMD ["/bin/sh", "/joplin/runserver.sh"]
