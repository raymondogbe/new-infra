# Use the official Node.js image as a base
FROM node:14

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "build"]





















# # Use the official Node.js image as a base
# FROM node:16 as build

# # Set the working directory inside the container
# WORKDIR /app

# # Copy package.json and package-lock.json into the working directory
# COPY package.json /app/
# COPY package-lock.json /app/

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code into the working dir
# COPY . /app/

# # Expose the port the app runs on
# EXPOSE 3000
# Define the command to start your application
# CMD ["npm", "start"]




# # Build the application
# RUN npm run build

# FROM nginx:latest
# COPY --from=build /app/build /usr/share/nginx/html/
# COPY --from=build /app/nginx/nginx.conf /etc/nginx.conf /etc/nginx/conf.d/default.conf
# # Serve the application using a simple server
# RUN npm install -g serve



