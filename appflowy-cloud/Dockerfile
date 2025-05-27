FROM node:20

# Install Go (for backend)
RUN apt-get update && apt-get install -y golang

# Install Supabase CLI if needed (optional)
RUN npm install -g supabase

# Set working directory
WORKDIR /app

# Clone the repo
RUN git clone https://github.com/AppFlowy-IO/AppFlowy-Cloud.git .

# Install frontend
WORKDIR /app/web
RUN npm install && npm run build

# Build backend
WORKDIR /app/backend
RUN go build -o appflowy-server main.go

# Expose port
EXPOSE 3000

# Start both backend + frontend (you may need a script for this)
CMD ["sh", "/app/run.sh"]
