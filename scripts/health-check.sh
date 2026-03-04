#!/bin/bash

URL="http://localhost:3000"
TIMEOUT=5

echo "Checking application health..."

RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$RESPONSE" -eq 200 ]; then
    echo "Application is healthy."
    exit 0
else
    echo "Application health check failed!"
    exit 1
fi