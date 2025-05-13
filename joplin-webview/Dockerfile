FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    curl \
    python3-pip \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:$PATH"

# Clone to subdir and install
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git /joplin && \
    cd /joplin && \
    pip install --no-cache-dir -r requirements.txt

# Change to app dir for CMD
WORKDIR /joplin

EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
