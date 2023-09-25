#!/bin/bash

cd ../

./mvnw clean

if [ "$1" = "graalvm" ];
then
    ./mvnw -Pnative native:compile > ./.results/build-graalvm.txt 2>&1
else
    ./mvnw package > ./.results/build-jvm.txt 2>&1
fi

cd .scripts
