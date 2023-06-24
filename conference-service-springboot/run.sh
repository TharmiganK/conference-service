#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./target/conference_service_springboot
else
    java -jar ./target/conference_service_springboot-1.0.0.jar
fi
