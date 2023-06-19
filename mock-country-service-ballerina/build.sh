#!/bin/bash

echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Building the Ballerina application"
echo ""

if [ "$1" = "graalvm" ];
then
    bal build --native
else
    bal build
fi

echo ""
echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Ballerina application built successfully"
echo ""
sleep 5

echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Executing the Ballerina application"
if [ "$1" = "graalvm" ];
then
    ./target/bin/country_service_ballerina
else
    java -jar ./target/bin/country_service_ballerina.jar 
fi
