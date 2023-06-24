#!/bin/bash

if [ "$1" = "now" ];
then
    ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
else
    while true; do
        ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
        sleep 1
    done
fi
