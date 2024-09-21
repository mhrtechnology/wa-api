FROM node:lts-alpine AS builder
ENV PORT=21465
WORKDIR /usr/wpp-server
RUN apk add chromium
COPY /src ./src
COPY package.json ./
RUN yarn install
RUN yarn build

# FROM node:lts-alpine
# WORKDIR /usr/wpp-server
# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# COPY package.json ./
# RUN apk add chromium
# COPY --from=builder /usr/wpp-server/ .

LABEL org.opencontainers.image.authors="pizi@hotmail.my"
LABEL version="2.7.0"
EXPOSE 21465
ENTRYPOINT ["node", "dist/server.js"]