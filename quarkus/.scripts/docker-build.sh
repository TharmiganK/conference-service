#!/bin/bash

cd ../
./mvnw clean

if [ "$1" = "graalvm" ];
then
    ./mvnw install -Dnative -Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-graalvmce-builder-image:22.3-java17 -Dquarkus.native.container-runtime=docker -Dquarkus.container-image.build=true
else
    ./mvnw install -Dquarkus.container-image.build=true
fi

cd .scripts
