#!/bin/bash

cd ../
./mvnw clean

if [ "$1" = "graalvm" ];
then
    if [ "$2" = "optimized" ];
    then
        ./mvnw package -Dpackaging=native-image -Dmicronaut.aot.enabled=true -Dmicronaut.aot.runtime=native -Dmicronaut.aot.packageName=conference_service_micronaut > ./.results/build-graalvm.txt 2>&1
    else
        ./mvnw package -Dpackaging=native-image > ./.results/build-graalvm.txt 2>&1
    fi
else
    if [ "$1" = "optimized" ];
    then
        ./mvnw package -Dmicronaut.aot.enabled=true -Dmicronaut.aot.packageName=conference_service_micronaut > ./.results/build-jvm.txt 2>&1
    else
        ./mvnw package > ./.results/build-jvm.txt 2>&1
    fi
fi

cd .scripts
