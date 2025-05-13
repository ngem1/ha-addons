FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libtiff5-dev \
    tk-dev \
    tcl-dev \
    libwebp-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone the Joplin Vieweb repository
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git . \
    && pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]