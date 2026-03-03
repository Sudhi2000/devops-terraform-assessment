#!/bin/bash
docker stop devops-container
docker rm devops-container
docker run -d -p 3000:3000 --name devops-container <your-ecr-uri>:previous