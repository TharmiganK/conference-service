#!/bin/bash

echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Building the Ballerina docker image"
echo ""

if [ "$1" = "graalvm" ];
then
    bal build --native --cloud=docker
else
    bal build --cloud=docker
fi

echo ""
echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Ballerina docker image built successfully"
echo ""
