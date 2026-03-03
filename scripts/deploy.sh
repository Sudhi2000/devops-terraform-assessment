#!/bin/bash
docker pull <your-ecr-uri>:latest
docker stop devops-container || true
docker rm devops-container || true
docker run -d -p 3000:3000 --name devops-container <your-ecr-uri>:latest