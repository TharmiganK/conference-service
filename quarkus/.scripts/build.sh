#!/bin/bash

cd ../

./mvnw clean > ./.results/build.txt 2>&1

if [ "$1" = "graalvm" ];
then
    ./mvnw install -Dnative -Dquarkus.native.builder-image=graalvm > ./.results/build-graalvm.txt 2>&1
else
    ./mvnw package -Dquarkus.package.type=uber-jar > ./.results/build-jvm.txt 2>&1
fi

cd .scripts
