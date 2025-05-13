FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone the app
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git . && \
    pip install --no-cache-dir -r requirements.txt

# Copy entrypoint
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Expose port
EXPOSE 8080

# Launch script
CMD [ "/run.sh" ]
