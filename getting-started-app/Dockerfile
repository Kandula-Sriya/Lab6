# syntax=docker/dockerfile:1

# Lab 6 - Dockerfile for the Docker "getting started" todo app
# Base image: lightweight Node.js (LTS) on Alpine Linux
FROM node:lts-alpine

# All following commands run inside /app in the container
WORKDIR /app

# Copy the project source into the image
COPY . .

# Install only production dependencies
RUN yarn install --production

# Start the app
CMD ["node", "src/index.js"]

# The app listens on port 3000
EXPOSE 3000
