FROM node:latest

#Update packages
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init

#Environment 
ENV NODE_ENV=production

#Create App directory
WORKDIR /usr/src/app

#Install App Dependencies
COPY . .

#Permission node
COPY --chown=node:node . .

#Run NPM Install
RUN npm install --production

#Usermode
USER node


#RUN Command
CMD ["dumb-init", "node", "server.js"]

