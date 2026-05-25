#!/bin/bash

# Stop existing container
docker stop flask-app || true

# Remove existing container
docker rm flask-app || true

# Kill anything using port 5000
fuser -k 5000/tcp || true

# Pull latest image
docker pull abhishekgowdrum/simple-python-flask-app:latest

# Run container
docker run -d \
  --name flask-app \
  -p 5000:5000 \
  abhishekgowdrum/simple-python-flask-app:latest