#!/bin/bash

echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Building the Ballerina application"
echo ""

if [ "$1" = "graalvm" ];
then
    bal clean
    bal build --graalvm > build-graalvm.txt 2>&1
else
    bal clean
    bal build
fi

echo ""
echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Ballerina application built successfully"
echo ""
