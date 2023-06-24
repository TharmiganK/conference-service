#!/bin/bash

if [ "$1" = "graalvm" ] ;
then
    docker run --name conference_service_springboot --init -p 8100:8100 --link country conference_service_springboot:1.0.0
else
    docker run --name conference_service_springboot_1 --init -p 8100:8100 --link country conference_service_springboot_1:1.0.0
fi
