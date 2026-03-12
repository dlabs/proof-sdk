FROM node:20-slim

RUN apt-get update && \
    apt-get install -y python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build
RUN cp -r dist/* public/

ENV PORT=4000
ENV NODE_ENV=production
EXPOSE 4000

CMD ["npx", "tsx", "server/index.ts"]
