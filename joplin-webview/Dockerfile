FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone the Joplin Vieweb repository
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git . \
    && pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]