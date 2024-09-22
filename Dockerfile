FROM node:lts-alpine
LABEL version="2.7.0"
LABEL org.opencontainers.image.authors="pizi@hotmail.my"
ENV PORT=21465
WORKDIR /usr
RUN apk add wget git chromium
RUN git clone https://github.com/mhrtechnology/wa-api.git --branch en --single-branch /usr/wpp-server
WORKDIR /usr/wpp-server
COPY /src/config.ts /usr/wpp-server/src
RUN npm install
RUN npm run build
EXPOSE 21465
ENTRYPOINT ["node", "dist/server.js"]