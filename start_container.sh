#!/bin/bash

# Stop all running containers
docker stop $(docker ps -q) || true

# Remove all containers
docker rm $(docker ps -aq) || true

# Pull latest image
docker pull abhishekgowdrum/simple-python-flask-app

# Run container
docker run -d -p 5000:5000 abhishekgowdrum/simple-python-flask-app