# Use a imagem oficial do Node.js 20 como base
FROM node:22-slim

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY . .

RUN yarn install

RUN yarn run build

EXPOSE 9615

ENTRYPOINT ["yarn", "run", "preview", "--", "--port", "9615", "--host"]
