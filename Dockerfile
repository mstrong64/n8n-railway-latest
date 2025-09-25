FROM node:24-alpine

RUN apk add --update graphicsmagick tzdata

USER root

RUN apk --update add --virtual build-dependencies python3 build-base && \
    npm_config_user=root npm install --location=global n8n && \
    apk del build-dependencies

WORKDIR /data

EXPOSE $PORT

ENV N8N_USER_ID=root
ENV N8N_EDITOR_BASE_URL=https://n8n-railway-latest-production.up.railway.app
ENV WEBHOOK_URL=https://n8n-railway-latest-production.up.railway.app

CMD export N8N_PORT=$PORT && n8n start
