#!/bin/bash

./mvnw clean

if [ "$1" = "graalvm" ];
then
    if [ "$2" = "optimized" ];
    then
        ./mvnw package -Dpackaging=native-image -Dmicronaut.aot.enabled=true -Dmicronaut.aot.runtime=native -Dmicronaut.aot.packageName=conference_service_micronaut
    else
        ./mvnw package -Dpackaging=native-image
    fi
else
    if [ "$1" = "optimized" ];
    then
        ./mvnw package -Dmicronaut.aot.enabled=true -Dmicronaut.aot.packageName=conference_service_micronaut
    else
        ./mvnw package
    fi
fi

# sleep 5

# if [ "$1" = "graalvm" ];
# then
#     ./target/conference_service_micronaut
# else
#     java -jar ./target/conference_service_micronaut-1.0.jar
# fi
