#!/bin/bash

echo "time = $(gdate +"%Y-%m-%dT%H:%M:%S.%3N")+05:30 level = INFO module = user/conference_service_ballerina message = Executing the Ballerina application"
if [ "$1" = "graalvm" ];
then
    ./target/bin/conference_service_ballerina
else
    java -jar ./target/bin/conference_service_ballerina.jar 
fi
