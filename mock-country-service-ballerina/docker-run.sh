#!/bin/bash

echo "time = $(TZ='GMT' date +"%Y-%m-%dT%H:%M:%S.%3NZ") level = INFO module = tharmigan/country_service_ballerina message = Running the docker image"
docker run --name country --init -v ./Config.toml:/home/ballerina/Config.toml -p 9000:9000 country_service_ballerina:latest
