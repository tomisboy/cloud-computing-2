FROM node:16
ENV NODE_ENV=production
WORKDIR /app
COPY . /app
RUN npm install --production
EXPOSE 5000
CMD [ "node", "server.js" ]