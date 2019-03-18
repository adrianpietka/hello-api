#!/usr/bin/env bash

echo "Build image..."
docker build . \
    --file Dockerfile \
    --tag devenv/hello-api:latest

if [[ $? == 1 ]]; then
    echo "Build failure."
    exit 1
fi