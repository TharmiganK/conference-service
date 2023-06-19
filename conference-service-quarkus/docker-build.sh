#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./mvnw clean install -Dnative -Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-graalvmce-builder-image:22.3-java11 -Dquarkus.native.container-runtime=docker -Dquarkus.container-image.build=true
else
    ./mvnw clean install -Dquarkus.container-image.build=true
fi
