#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --rm --name conference_service_ballerina -v ./Config_cloud.toml:/home/ballerina/Config.toml -p 8102:8102 --link country conference_service_ballerina:latest
else
    docker run --rm --name conference_service_ballerina_1 -v ./Config_cloud.toml:/home/ballerina/Config.toml -p 8102:8102 --link country conference_service_ballerina_1:latest
fi

echo ""
