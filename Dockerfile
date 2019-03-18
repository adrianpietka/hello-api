FROM node:8.14-alpine as build

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .
RUN npm install --no-progress && npm cache clean --force

COPY . .

EXPOSE 3000

CMD ["npm", "run", "start"]