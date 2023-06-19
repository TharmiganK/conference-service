#!/bin/bash

echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Building the Ballerina docker image"
echo ""

if [ "$1" = "graalvm" ];
then
    bal build --native --cloud=docker
else
    bal build --cloud=docker
fi

echo ""
echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Ballerina docker image built successfully"
echo ""
sleep 5

echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Running the docker image"
docker run --name country --init -v ./Config.toml:/home/ballerina/Config.toml -p 9000:9000 country_service_ballerina:latest
