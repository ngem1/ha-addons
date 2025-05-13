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
WORKDIR /app

# ------------------------------------------------
# 3. Clone the real backend repo and install deps
#    (requirements.txt lives at repo root)
# ------------------------------------------------
RUN git clone https://github.com/joplin-vieweb/django-joplin-vieweb.git /joplin && \
    pip install --no-cache-dir -r /joplin/requirements.txt

# ------------------------------------------------
# 4. Use the project’s own launch script
# ------------------------------------------------
WORKDIR /joplin
RUN chmod +x runserver.sh

# Upstream script starts Nginx on port 80 and Daphne on 8001
EXPOSE 80

CMD ["/bin/sh","/joplin/runserver.sh"]
