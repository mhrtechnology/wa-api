FROM node:lts-alpine
ENV PORT=21465
WORKDIR /usr
RUN apk add wget git
RUN git clone https://github.com/mhrtechnology/wa-api.git --branch en --single-branch /usr/wpp-server
WORKDIR /usr/wpp-server
COPY ./config.ts /usr/wpp-server/src/config.ts
RUN npm install
RUN npm run build
EXPOSE 21465
ENTRYPOINT ["node", "dist/server.js"]