# Base image
FROM node:20-alpine

# Working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy all frontend source code
COPY . .

# Set environment variable for production build
ARG REACT_APP_API_URL
ENV REACT_APP_API_URL=$REACT_APP_API_URL

# Build the React app
RUN npm run build

# Use nginx to serve the build
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

# Copy custom nginx config if any
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
