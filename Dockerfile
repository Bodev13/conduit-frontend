# Use the official Node.js image to build the frontend
FROM node:20 AS build

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the project files
COPY . .

# Build the frontend application
RUN npm run build --prod

# Use the official Nginx image to serve the static files
FROM nginx:alpine

# Copy the built frontend files to Nginx's default HTML directory
COPY --from=build /app/dist/angular-conduit /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run the Nginx
CMD ["nginx", "-g", "daemon off;"]