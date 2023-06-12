#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./mvnw clean install -Dnative -Dquarkus.native.builder-image=graalvm -Dquarkus.native.container-runtime=docker
else
    ./mvnw clean install -Dquarkus.container-image.build=true
fi
