# syntax=docker/dockerfile:1

# Lab 6 - Dockerfile for the Docker "getting started" todo app
# Base image: lightweight Node.js (LTS) on Alpine Linux
FROM node:lts-alpine

# All following commands run inside /app in the container
WORKDIR /app

# Copy the project source into the image
COPY . .

# Install only production dependencies.
# Newer node:lts-alpine images no longer bundle yarn, so npm is used
# with the committed package-lock.json (equivalent to yarn install --production).
RUN npm ci --omit=dev

# Start the app
CMD ["node", "src/index.js"]

# The app listens on port 3000
EXPOSE 3000
