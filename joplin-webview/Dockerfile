# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Clone Joplin Vieweb repository
RUN git clone https://github.com/joplin-vieweb/joplin-vieweb.git . \
    && pip install -r requirements.txt

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Expose port
EXPOSE 8080

# Start the application
CMD [ "/run.sh" ]
