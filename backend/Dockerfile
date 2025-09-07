# Base image
FROM node:20-alpine

# Working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all backend source code
COPY . .

# Set environment variables
ARG MONGO_URI
ARG JWT_SECRET
ARG PORT
ENV MONGO_URI=$MONGO_URI
ENV JWT_SECRET=$JWT_SECRET
ENV PORT=$PORT

# Expose port
EXPOSE 5001

# Start the backend
CMD ["node", "src/index.js"]
