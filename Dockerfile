FROM node:lts-alpine AS builder
ENV PORT=21465
WORKDIR /usr/wpp-server
RUN yarn install
RUN yarn build

FROM node:lts-alpine
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
WORKDIR /usr/wpp-server
RUN apk add chromium
COPY --from=builder /usr/wpp-server/ .
EXPOSE 21465
ENTRYPOINT ["node", "dist/server.js"]