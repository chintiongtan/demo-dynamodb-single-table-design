#!/bin/bash

aws dynamodb update-table --endpoint-url http://localstack:4566 \
    --table-name TheOneAndOnlyTable \
    --attribute-definitions \
        AttributeName=EntityType,AttributeType=S \
        AttributeName=Id,AttributeType=S \
    --global-secondary-index-updates \
    '[{"Create": {
        "IndexName": "EntityTypeIndex",
        "KeySchema": [
            {"AttributeName": "EntityType", "KeyType": "HASH"},
            {"AttributeName": "Id", "KeyType": "RANGE"}
        ],
        "Projection": {
            "ProjectionType": "ALL"
        },
        "ProvisionedThroughput": {
            "ReadCapacityUnits": 10,
            "WriteCapacityUnits": 10
        }
    }}]'
