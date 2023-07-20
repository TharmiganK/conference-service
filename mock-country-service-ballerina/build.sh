#!/bin/bash

echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/country_service_ballerina message = Building the Ballerina application"
echo ""

if [ "$1" = "graalvm" ];
then
    bal build --graalvm
else
    bal build
fi

echo ""
echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/country_service_ballerina message = Ballerina application built successfully"
echo ""
