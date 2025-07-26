FROM node:18

# Install build tools (needed for some dependencies)
RUN apt-get update && apt-get install -y python3 make g++

# Set working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Upgrade npm to support workspaces
RUN npm install -g npm@9

# Install dependencies and build n8n
RUN npm install && npm run build

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["npm", "run", "start"]
