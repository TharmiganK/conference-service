#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./target/conference_service_micronaut
else
    java -jar ./target/conference_service_micronaut-1.0.jar
fi
