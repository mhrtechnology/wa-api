FROM node:lts-alpine AS base
RUN apk update
RUN apk add --no-cache vips-dev fftw-dev gcc g++ make libc6-compat wget git chromium
RUN rm -rf /var/cache/apk/*

FROM base AS backend
RUN git clone https://github.com/mhrtechnology/wa-api.git --branch en --single-branch /home/node/wpp-server
WORKDIR /home/node/wpp-server
RUN npm install
EXPOSE 21465
ENTRYPOINT ["npm", "run", "dev"]