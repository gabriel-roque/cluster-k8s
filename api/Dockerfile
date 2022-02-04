FROM node:14.0.0-alpine

WORKDIR /api

COPY package.json .
RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "start"]