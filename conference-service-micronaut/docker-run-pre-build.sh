#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --rm --name conference_service_micronaut -p 8101:8101 --link country ktharmi176/conference-service-micronaut-graalvm:latest
else
    docker run --rm --name conference_service_micronaut_1 -p 8101:8101 --link country ktharmi176/conference-service-micronaut:latest
fi

echo ""
