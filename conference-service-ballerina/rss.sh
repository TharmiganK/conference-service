#!/bin/bash

if [ "$1" = "now" ];
then
    if [ "$2" = "docker " ];
    then
        docker stats --no-stream conference_service_ballerina
    else
        ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
    fi
    exit 0
else
    if [ "$1" = "docker " ];
    then
        if [ "$2" = "now" ];
        then
            docker stats --no-stream conference_service_ballerina
            exit 0
        else
            while true; do
                docker stats --no-stream conference_service_ballerina
                sleep 1
            done
        fi
    else
        if [ "$2" = "now" ];
        then
            docker stats --no-stream conference_service_ballerina
            exit 0
        else
            while true; do
                docker stats --no-stream conference_service_ballerina
                sleep 1
            done
        fi
    fi
fi
