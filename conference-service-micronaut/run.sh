#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./target/conference_service_micronaut >> run-graalvm.txt 2>&1
    echo "" >> run-graalvm.txt
else
    java -jar ./target/conference_service_micronaut-1.0.jar >> run-jvm.txt 2>&1
    echo "" >> run-jvm.txt
fi
