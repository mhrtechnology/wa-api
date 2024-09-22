FROM node:lts-alpine AS base
RUN apk add wget git chromium

FROM base AS backend
RUN git clone https://github.com/mhrtechnology/wa-api.git --branch en --single-branch /home/node/wpp-server
WORKDIR /home/node/wpp-server
RUN npm install
RUN npm audit --fix
EXPOSE 21465
ENTRYPOINT ["npm", "run", "dev"]