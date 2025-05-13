##############################################
#  Home-Assistant add-on – Joplin-Vieweb
##############################################

# 1) Base image
FROM python:3.11-slim

# 2) Install OS deps
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git build-essential libpq-dev curl python3-pip nginx && \
    curl -sSf https://sh.rustup.rs | sh -s -- -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:${PATH}"

# 3) Clone the Django project
WORKDIR /app
RUN git clone https://github.com/joplin-vieweb/django-joplin-vieweb.git /joplin

# 4) Pre-create the config dir & seed it with the production template
RUN mkdir -p /root/.config/joplin-vieweb \
 && cp /joplin/settings/settings-production.py /root/.config/joplin-vieweb/settings.py

# 5) Install Python requirements
RUN pip install --no-cache-dir -r /joplin/requirements.txt

# 6) Copy in our custom entrypoint that will do the placeholder-replacement
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# 7) Tell Django where to look
ENV DJANGO_SETTINGS_MODULE=settings.settings

# 8) Set up workdir & run permissions
WORKDIR /joplin
RUN chmod +x runserver.sh

# 9) Expose the HTTP port and use our entrypoint
EXPOSE 80
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/bin/sh", "/joplin/runserver.sh"]
