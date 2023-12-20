# Use an official Node.js runtime as the base image
FROM node:20-bookworm-slim

# Create the app directories and set ownership
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Set the working directory in the container
WORKDIR /home/node/app

# Switch to the node user for the image
USER node

# Copy package.json and package-lock.json to the working directory
COPY --chown=node:node package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the app source code to the working directory
COPY --chown=node:node . .

# Expose the port on which the app will run
EXPOSE 3000

# Start the app
CMD [ "npm", "start" ]
