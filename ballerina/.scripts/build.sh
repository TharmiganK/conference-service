#!/bin/bash

echo "time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=Building the Ballerina application"
echo ""

if [ "$1" = "graalvm" ];
then
    bal clean --target-dir ../target
    bal build --graalvm ../../ballerina > ../.results/build-graalvm.txt 2>&1
else
    bal clean --target-dir ../target
    bal build ../../ballerina
fi

echo ""
echo "time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=Ballerina application built successfully"
echo ""
