# ---------- builder ----------
FROM python:3.12-slim-bookworm AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev git curl && \
    curl -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

ARG JOPLIN_TAG=v0.8.3
RUN git clone --depth 1 --branch ${JOPLIN_TAG} \
      https://github.com/joplin-vieweb/django-joplin-vieweb.git /src
WORKDIR /src
RUN pip wheel --wheel-dir /wheels -r requirements.txt

# ---------- runtime ----------
FROM python:3.12-slim-bookworm
COPY --from=builder /wheels /wheels
RUN pip install --no-cache-dir /wheels/* && \
    apt-get purge -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

# app user
RUN useradd -m app
USER app
WORKDIR /app
COPY --from=builder /src /app

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
EXPOSE 80
CMD ["bash", "runserver.sh"]
