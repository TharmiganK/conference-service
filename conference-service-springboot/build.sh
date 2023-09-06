#!/bin/bash

./mvnw clean

if [ "$1" = "graalvm" ];
then
    ./mvnw -Pnative native:compile > build-graalvm.txt 2>&1
else
    ./mvnw package
fi

# sleep 5

# if [ "$1" = "graalvm" ];
# then
#     ./target/conference_service_springboot
# else
#     java -jar ./target/conference_service_springboot-1.0.0.jar
# fi
