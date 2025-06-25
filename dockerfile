# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lock file
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the files
COPY . .

# Build the React app
RUN yarn build

# Use nginx to serve
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
