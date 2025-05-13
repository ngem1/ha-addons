##############################################
#  Home-Assistant add-on – Joplin-Vieweb
##############################################

# 1) Base image
FROM python:3.11-slim

# 2) Install OS deps
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git build-essential libpq-dev curl python3-pip nginx && \
    rm -rf /var/lib/apt/lists/*

# 3) Clone & install Python deps
WORKDIR /app
RUN git clone https://github.com/joplin-vieweb/django-joplin-vieweb.git /joplin && \
    pip install --no-cache-dir -r /joplin/requirements.txt

# 4) Tell Django which settings module to load
ENV DJANGO_SETTINGS_MODULE=settings.settings

# 5) Seed the config dir with the production template
RUN mkdir -p /root/.config/joplin-vieweb && \
    cp /joplin/settings/settings-production.py /root/.config/joplin-vieweb/settings.py

# 6) Make upstream launch script executable
WORKDIR /joplin
RUN chmod +x runserver.sh

# 7) Expose the HTTP port
EXPOSE 80

# 8) On container start, replace placeholders and then exec runserver.sh
CMD ["sh","-c", "\
  sed -i \"s|JOPLIN_URL_PLACEHOLDER|${JOPLIN_URL}|g\" /root/.config/joplin-vieweb/settings.py && \
  sed -i \"s|JOPLIN_TOKEN_PLACEHOLDER|${JOPLIN_TOKEN}|g\" /root/.config/joplin-vieweb/settings.py && \
  sed -i \"s|ORIGINS_PLACEHOLDER|${ORIGINS}|g\" /root/.config/joplin-vieweb/settings.py && \
  exec ./runserver.sh \
"]
