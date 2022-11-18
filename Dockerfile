FROM node:18-alpine
WORKDIR /usr
COPY package.json ./
COPY tsconfig.json ./
COPY . .
RUN ls -a
RUN npm install
RUN npm run build

FROM node:18-alpine
ENV PORT=8000
WORKDIR /usr
COPY package.json ./
RUN npm install pm2 -g
RUN npm install --only=production
COPY --from=0 /usr/dist .
EXPOSE $PORT
RUN pm2 start index.js
