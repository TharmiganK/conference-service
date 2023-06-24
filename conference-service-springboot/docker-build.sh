#!/bin/bash

./mvnw clean

if [ "$1" = "graalvm" ];
then
    ./mvnw spring-boot:build-image -Pnative
else
    ./mvnw spring-boot:build-image
fi
