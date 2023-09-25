#!/bin/bash

cd ../

echo "time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=Building the Ballerina application"
echo ""

bal clean

if [ ! -d "generated" ]; then
    echo "time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=Generating persist client code"
    echo ""
    bal persist generate
fi

if [ "$1" = "graalvm" ];
then
    bal build --graalvm > ./.results/build-graalvm.txt 2>&1
else
    bal build > ./.results/build-jvm.txt 2>&1
fi

echo ""
echo "time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=Ballerina application built successfully"
echo ""
