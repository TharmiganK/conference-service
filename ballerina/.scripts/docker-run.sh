#!/bin/bash

docker run --name conference-service-ballerina --network host --rm -v ../Config.toml:/home/ballerina/Config.toml conference_service_ballerina:latest
