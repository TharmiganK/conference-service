#!/bin/bash

if [ "$1" = "now" ];
then
    docker stats --no-stream $2 | awk 'NR>1' | awk '{print $3, $4, $2;}'
else
    while true; do
        docker stats $2
    done
fi
