#!/bin/bash

aws dynamodb delete-table --endpoint-url http://localstack:4566 \
    --table-name TheOneAndOnlyTable
