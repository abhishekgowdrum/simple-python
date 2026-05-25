#!/bin/bash

# Stop and remove old container
docker stop flask-app || true
docker rm flask-app || true

# Kill any process using port 5000
sudo kill -9 $(sudo lsof -t -i:5000) || true

# Remove unused containers
docker container prune -f || true

# Pull latest image
docker pull abhishekgowdrum/simple-python-flask-app:latest

# Run new container
docker run -d \
  --name flask-app \
  -p 5000:5000 \
  abhishekgowdrum/simple-python-flask-app:latest