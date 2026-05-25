#!/bin/bash

#!/bin/bash

# Stop and remove old container
docker stop flask-app || true
docker rm flask-app || true

# Kill process using port 5000
PID=$(sudo lsof -t -i:5000)

if [ ! -z "$PID" ]; then
    sudo kill -9 $PID
fi

# Clean unused containers
docker container prune -f || true

# Pull latest image
docker pull abhishekgowdrum/simple-python-flask-app:latest

# Run container
docker run -d \
  --name flask-app \
  -p 8000:5000 \
  abhishekgowdrum/simple-python-flask-app:latest