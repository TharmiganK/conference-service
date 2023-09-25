#!/bin/bash
if [ "$1" = "now" ];
then
    ps aux | grep conference_service_ballerina | awk '{$6=($6/1024)"M";}{$3=$3"%";}{print $3, $6, $11, $12, $13;}'
else
    while true; do
        ps aux | grep conference_service_ballerina | awk '{$6=($6/1024)"M";}{$3=$3"%";}{print $3, $6, $11, $12, $13;}'
        sleep 1
    done
fi
