FROM node:lts-alpine
ENV PORT=21465
RUN apk add wget git
RUN git clone https://github.com/mhrtechnology/wa-api.git --branch en --single-branch /usr/wpp-server
WORKDIR /usr/wpp-server
RUN npm install
EXPOSE 21465
ENTRYPOINT ["npm", "run", "dev"]