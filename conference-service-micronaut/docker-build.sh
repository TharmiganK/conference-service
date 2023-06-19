#!/bin/bash

if [ "$1" = "graalvm" ];
then
    if [ "$2" = "optimized" ];
    then
        ./mvnw clean package -Dpackaging=docker-native -Pgraalvm -Dmicronaut.aot.enabled=true -Dmicronaut.aot.runtime=native -Dmicronaut.aot.packageName=conference_service_micronaut
    else
        ./mvnw clean package -Dpackaging=docker-native -Pgraalvm
    fi
else
    if [ "$1" = "optimized" ];
    then
        ./mvnw clean package -Dpackaging=docker-native -Dmicronaut.aot.enabled=true -Dmicronaut.aot.packageName=conference_service_micronaut
    else
        ./mvnw clean package -Dpackaging=docker-native
    fi
fi
