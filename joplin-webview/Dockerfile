##############################################
# Joplin-Vieweb – Home-Assistant add-on image
##############################################

FROM python:3.11-slim

#—Base set-up ————————————————————————————————
WORKDIR /app

RUN apt-get update && apt-get install -y \
        git build-essential libpq-dev curl python3-pip \
    && curl -sSf https://sh.rustup.rs | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:${PATH}"

#—Clone the Django backend & install deps ————
RUN git clone https://github.com/joplin-vieweb/django-joplin-vieweb.git /joplin \
 && pip install --no-cache-dir -r /joplin/requirements.txt

#—Switch to the backend folder (where manage.py is)
WORKDIR /joplin

#—Expose the dev-server port used by Vieweb
EXPOSE 8080

#—Launch Django (good enough for LAN use; swap for Gunicorn if desired)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
