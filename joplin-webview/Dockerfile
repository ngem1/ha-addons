FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies and Rust
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    curl \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && export PATH="$HOME/.cargo/bin:$PATH" \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:$PATH"

# Clone and install
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb/blob/f31e27820e20c133b221c5ce66a6b2fadde27f1d/docker-compose-joplin-only.yml

EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
