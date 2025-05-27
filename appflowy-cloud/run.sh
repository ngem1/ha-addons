#!/bin/bash

# Start backend
/app/backend/appflowy-server &

# Start frontend
cd /app/web
npm run start
