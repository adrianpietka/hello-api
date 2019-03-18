#!/usr/bin/env bash

echo "Run container with AWS CloudWatch Logs..."
docker run --log-driver=awslogs \
    --log-opt awslogs-region=us-west-1b \
    --log-opt awslogs-group=hello-api-service-group \
    --log-opt awslogs-stream=hello-api-service-stream \
    --log-opt awslogs-datetime-format='\[%Y-%m-%dT%H:%M:%S%z\]' \
    --log-opt awslogs-create-group=true \
    -i \
    -p 3000:3000 \
    devenv/hello-api:latest

docker run \
    -i \
    -p 3000:3000 \
    devenv/hello-api:latest