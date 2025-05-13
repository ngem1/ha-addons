FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies and Rust (for psycopg2)
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    curl \
    python3-pip \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/*

# Rust in path
ENV PATH="/root/.cargo/bin:$PATH"

# Clone Joplin Vieweb and install Python deps from backend
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git /joplin && \
    pip install --no-cache-dir -r /joplin/backend/requirements.txt

# Set working directory to backend
WORKDIR /joplin/backend

# Expose Django port
EXPOSE 8080

# Run Django dev server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
