#!/bin/bash

echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Building the Ballerina docker image"
echo ""

if [ "$1" = "graalvm" ];
then
    bal clean
    bal build --native --cloud=docker
else
    bal clean
    bal build --cloud=docker
fi

echo ""
echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Ballerina docker image built successfully"
echo ""
sleep 5

# echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Running the docker image"
# docker run -d conference_service_ballerina:latest
