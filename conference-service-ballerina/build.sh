#!/bin/bash

echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Building the Ballerina application"
echo ""

if [ "$1" = "graalvm" ];
then
    bal clean
    bal build --native
else
    bal clean
    bal build
fi

echo ""
echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Ballerina application built successfully"
echo ""
# sleep 5

# echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = Executing the Ballerina application"
# if [ "$1" = "graalvm" ];
# then
#     ./target/bin/conference_service_ballerina
# else
#     java -jar ./target/bin/conference_service_ballerina.jar
# fi
