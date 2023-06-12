#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./mvnw clean package -Dpackaging=docker-native -Pgraalvm
else
    ./mvnw clean package -Dpackaging=docker
fi
