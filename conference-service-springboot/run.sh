#!/bin/bash

docker compose up -d
sleep 10

echo "Running the application"

if [ "$1" = "graalvm" ];
then
    ./target/conference_service_springboot >> run-graalvm.txt 2>&1
    echo "" >> run-graalvm.txt
else
    java -jar ./target/conference_service_springboot-1.0.0.jar >> run-jvm.txt 2>&1
    echo "" >> run-jvm.txt
fi

docker compose down
