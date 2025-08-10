#!/bin/bash

aws dynamodb batch-write-item  --endpoint-url http://localstack:4566 \
    --request-items file:///workspace/packages/demo/scripts/seed.json 
