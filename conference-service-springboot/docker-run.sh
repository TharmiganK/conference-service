#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --rm --name conference_service_springboot -p 8103:8103 --link country conference_service_springboot:1.0.0
else
    docker run --rm --name conference_service_springboot_1 -p 8103:8103 --link country conference_service_springboot_1:1.0.0
fi

echo ""
