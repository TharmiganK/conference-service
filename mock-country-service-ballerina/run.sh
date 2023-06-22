#!/bin/bash

echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = tharmigan/country_service_ballerina message = Executing the Ballerina application"
if [ "$1" = "graalvm" ];
then
    ./target/bin/country_service_ballerina
else
    java -jar ./target/bin/country_service_ballerina.jar 
fi
