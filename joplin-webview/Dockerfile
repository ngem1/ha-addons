FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies and clone repo
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git . && \
    pip install --no-cache-dir -r requirements.txt

# Expose web port
EXPOSE 8080

# Run the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]