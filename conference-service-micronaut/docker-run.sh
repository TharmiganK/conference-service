#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --name conference_service_micronaut --init -p 8101:8101 --link country conference_service_micronaut:latest
else
    docker run --name conference_service_micronaut_1 --init -p 8101:8101 --link country conference_service_micronaut_1:latest
fi
