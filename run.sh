#!/usr/bin/env bash

echo "Build image..."
docker build . \
    --file Dockerfile \
    --tag devenv/hello-api:latest

if [[ $? == 1 ]]; then
    echo "Build failure."
    exit 1
fi

echo "Run container..."
docker run --log-driver=awslogs \
    --log-opt awslogs-region=us-west-1b \
    --log-opt awslogs-group=hello-api-service-group \
    --log-opt awslogs-stream=hello-api-service-stream \
    --log-opt awslogs-datetime-format='\[%Y-%m-%dT%H:%M:%S%z\]' \
    --log-opt awslogs-create-group=true \
    -i \
    -p 3000:3000 \
    devenv/hello-api:latest