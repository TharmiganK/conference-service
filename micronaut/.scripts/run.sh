#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ../target/conference_service_micronaut -Xmx512m >> ../.results/run-graalvm.txt 2>&1
    echo "" >> ../.results/run-graalvm.txt
else
    java  -Xmx512m  -jar ../target/conference_service_micronaut-1.0.jar >> ../.results/run-jvm.txt 2>&1
    echo "" >> ../.results/run-jvm.txt
fi
