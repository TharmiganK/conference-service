#!/bin/bash

cd ../

./mvnw clean

if [ "$1" = "graalvm" ];
then
    ./mvnw install -Dnative -Dquarkus.native.builder-image=graalvm > ./.results/build-graalvm.txt 2>&1
else
    ./mvnw package -Dquarkus.package.type=uber-jar
fi

cd .scripts
