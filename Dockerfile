# Use the official Node.js image as the base image
FROM --platform=linux/amd64 node:18-alpine

# Set the working directory inside the container
WORKDIR /app


# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

ENV PORT=3000 \
    MESSAGE="Hello, Docker!"

# Expose the port the app runs on
EXPOSE $PORT

# Command to run the app
CMD ["node", "index.js"]