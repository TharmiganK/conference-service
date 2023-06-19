#!/bin/bash

echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = user/conference_service_ballerina message = Executing the Ballerina application"
docker run --init -v ./Config.toml:/home/ballerina/Config.toml -p 8102:8102 conference_service_ballerina:latest
