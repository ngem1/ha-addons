FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache git && \
    git clone https://github.com/foxmask/joplin-web.git . && \
    npm install && \
    npm run build

EXPOSE 3000

CMD ["npm", "start"]
