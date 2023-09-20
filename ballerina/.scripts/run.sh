#!/bin/bash
docker compose up -d
sleep 45

echo "Running the application"

cp ../Config.toml ./Config.toml

if [ "$1" = "graalvm" ];
then
    echo "time=$(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module=tharmigan/conference_service_ballerina message=\"Executing the Ballerina application\"" >> ../.results/run-graalvm.txt
    ../target/bin/conference_service_ballerina >> ../.results/run-graalvm.txt 2>&1
    echo "" >> ../.results/run-graalvm.txt
else
    echo "time=$(date +"%Y-%m-%dT%H:%M:%S.%3N%:z") level=INFO module = tharmigan/conference_service_ballerina message=\"Executing the Ballerina application\"" >> ../.results/run-jvm.txt
    java -jar ../target/bin/conference_service_ballerina.jar >> ../.results/run-jvm.txt 2>&1
    echo "" >> ../.results/run-jvm.txt
fi

rm -rf Config.toml

docker compose down
