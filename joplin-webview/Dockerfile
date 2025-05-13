################ Joplin-Vieweb – HA add-on image ################
FROM python:3.11-slim

# ---------- system deps ----------
RUN apt-get update && apt-get install -y --no-install-recommends \
        git build-essential libpq-dev curl \
    && curl -sSf https://sh.rustup.rs | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/*
ENV PATH="/root/.cargo/bin:${PATH}"

# ---------- clone backend & install ----------
RUN git clone --depth 1 https://github.com/joplin-vieweb/django-joplin-vieweb.git /joplin \
 && pip install --no-cache-dir -r /joplin/requirements.txt

# ---------- launch script ----------
WORKDIR /joplin
RUN chmod +x runserver.sh          # helper that creates manage.py etc.
EXPOSE 80
CMD ["/bin/sh", "/joplin/runserver.sh"]
