#!/bin/bash

cd ../

./mvnw clean

if [ "$1" = "graalvm" ];
then
    ./mvnw -Pnative native:compile > build-graalvm.txt 2>&1
else
    ./mvnw package
fi

cd .scripts
