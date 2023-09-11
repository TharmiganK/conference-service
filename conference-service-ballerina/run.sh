#!/bin/bash
docker compose up -d
sleep 45

echo "Running the application"

if [ "$1" = "graalvm" ];
then
    echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = \"Executing the Ballerina application\"" >> run-graalvm.txt
    ./target/bin/conference_service_ballerina >> run-graalvm.txt 2>&1
    echo "" >> run-graalvm.txt
else
    echo "time = $(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level = INFO module = tharmigan/conference_service_ballerina message = \"Executing the Ballerina application\"" >> run-jvm.txt
    java -jar ./target/bin/conference_service_ballerina.jar >> run-jvm.txt 2>&1
    echo "" >> run-jvm.txt
fi

docker compose down
