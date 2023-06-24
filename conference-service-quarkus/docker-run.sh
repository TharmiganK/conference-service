#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --rm --name conference_service_quarkus -p 8100:8100 --link country tharmigan/conference_service_quarkus:1.0.0
else
    docker run --rm --name conference_service_quarkus_1 -p 8100:8100 --link country tharmigan/conference_service_quarkus_1:1.0.0
fi

echo ""
