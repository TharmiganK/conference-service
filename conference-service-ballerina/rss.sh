#!/bin/bash

if [ "$1" = "now" ];
then
    if [ "$2" = "docker " ];
    then
        docker ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
    else
        ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
    fi
    exit 0
else
    if [ "$1" = "docker " ];
    then
        if [ "$2" = "now" ];
        then
            docker ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
            exit 0
        else
            while true; do
                docker ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
                sleep 1
            done
        fi
    else
        if [ "$2" = "now" ];
        then
            ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
            exit 0
        else
            while true; do
                ps -o pid,rss,command | grep conference_service_ballerina | awk '{$2=int($2/1024)"M";}{ print;}'
                sleep 1
            done
        fi
    fi
fi
