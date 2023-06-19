#!/bin/bash

echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/conference_service_ballerina message = Executing the Ballerina application"
docker run --name conference_service_ballerina --init -v ./Config.toml:/home/ballerina/Config.toml -p 8102:8102 --link country conference_service_ballerina:latest
