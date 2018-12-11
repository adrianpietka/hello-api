env | grep AWS_

docker run --log-driver=awslogs \
    --log-opt awslogs-region=us-west-1b \
    --log-opt awslogs-group=hello-api-service-group \
    --log-opt awslogs-stream=hello-api-service-hub-100 \
    --log-opt awslogs-datetime-format='\[%Y-%m-%dT%H:%M:%S%z\]' \
    --log-opt awslogs-create-group=true \
    -i \
    -p 3000:3000 \
    sarehub/hello-api