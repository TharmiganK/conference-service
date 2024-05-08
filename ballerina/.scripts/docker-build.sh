#!/bin/bash

echo "time=$(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=Building the Ballerina docker image"
echo ""

if [ "$1" = "graalvm" ];
then
    bal clean --target-dir ../target
    bal build --graalvm --cloud=docker ../../ballerina
else
    bal clean --target-dir ../target
    bal build --cloud=docker ../../ballerina
fi

echo ""
echo "time=$(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=Ballerina docker image built successfully"
echo ""
sleep 5
