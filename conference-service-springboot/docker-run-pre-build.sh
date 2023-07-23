#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --rm --name conference_service_springboot -p 8103:8103 --link country ktharmi176/conference-service-springboot-graalvm:latest
else
    docker run --rm --name conference_service_springboot_1 -p 8103:8103 --link country ktharmi176/conference-service-springboot:latest
fi

echo ""
