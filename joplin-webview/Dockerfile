##############################################
#   Home-Assistant add-on – Joplin-Vieweb
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

# 3) Clone the Django project and install Python packages
WORKDIR /app
RUN git clone https://github.com/joplin-vieweb/django-joplin-vieweb.git /joplin && \
    pip install --no-cache-dir -r /joplin/requirements.txt

# 4) Set the Django settings module that runserver.sh will export
ENV DJANGO_SETTINGS_MODULE=settings.settings

# 5) Pre-create the config dir & copy the “production” template
#    (runserver.sh expects ./settings/settings-production.py in the repo)
RUN mkdir -p /root/.config/joplin-vieweb \
 && cp /joplin/settings/settings-production.py /root/.config/joplin-vieweb/settings.py

# 6) Entrypoint
WORKDIR /joplin
RUN chmod +x runserver.sh

# 7) Expose Nginx on 80
EXPOSE 80

CMD ["/bin/sh", "/joplin/runserver.sh"]
