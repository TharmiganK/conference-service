#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --rm --name conference_service_quarkus -p 8100:8100 --link country ktharmi176/conference-service-quarkus-graalvm:latest
else
    docker run --rm --name conference_service_quarkus_1 -p 8100:8100 --link country ktharmi176/conference-service-quarkus:latest
fi

echo ""
