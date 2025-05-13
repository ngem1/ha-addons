FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies and Rust (for psycopg build)
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    curl \
    python3-pip \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/*

# Ensure Rust binaries are in path
ENV PATH="/root/.cargo/bin:$PATH"

# Clone Joplin Vieweb repo and install requirements from root
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git /joplin && \
    pip install --no-cache-dir -r /joplin/requirements.txt

# Set working directory to backend
WORKDIR /joplin/backend

# Expose port
EXPOSE 8080

# Run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
