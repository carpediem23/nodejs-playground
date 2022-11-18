FROM node:18-alpine
ENV NODE_ENV=production
ENV PORT=3000
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --silent && mv node_modules ../
COPY . .
EXPOSE $PORT
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
