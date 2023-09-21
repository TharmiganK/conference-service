#!/bin/bash

docker compose up -d
sleep 45

echo "Running the application"

if [ "$1" = "graalvm" ];
then
    ./target/conference_service_quarkus-1.0.0-runner -Xmx512m >> ../.results/run-graalvm.txt 2>&1
    echo "" >> ../.results/run-graalvm.txt
else
    java  -Xmx512m  -jar ./target/conference_service_quarkus-1.0.0-runner.jar >>../.results/run-jvm.txt 2>&1
    echo "" >> ../.results/run-jvm.txt
fi

docker compose down
