#!/bin/bash

set -e

IMAGE=$1
CONTAINER_NAME="app"

echo "Starting deployment..."

# Pull latest image
docker pull $IMAGE

# Pre-deployment health check
echo "Checking existing container..."

if docker ps | grep $CONTAINER_NAME; then
    echo "Stopping existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

echo "Starting new container..."

docker run -d \
  -p 3000:3000 \
  --name $CONTAINER_NAME \
  --restart unless-stopped \
  $IMAGE

sleep 5

echo "Running post-deployment health check..."

curl -f http://localhost:3000 || {
  echo "Health check failed!"
  exit 1
}

echo "Deployment successful!"