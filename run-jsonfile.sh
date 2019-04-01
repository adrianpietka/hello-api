#!/usr/bin/env bash

echo "Run container witho json-file logger..."
docker run --log-driver=json-file \
    --log-opt max-size=1m \
    --log-opt max-file=2 \
    -i \
    -p 3000:3000 \
    devenv/hello-api:latest
