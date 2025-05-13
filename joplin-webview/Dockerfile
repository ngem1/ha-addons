FROM python:3.11-slim

WORKDIR /app

# Install system dependencies, Rust, and pip
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    curl \
    python3-pip \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:$PATH"

# Clone the Joplin Vieweb source
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git . && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
