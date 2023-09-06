#!/bin/bash

if [ "$1" = "graalvm" ]; then
    psrecord --plot plot-graalvm.png --log log-graalvm.txt --interval 0.1 $(ps aux | grep conference_service_micronaut | grep -v 'grep' | awk '{print $2}')
else
    psrecord --plot plot-jvm.png --log log-jvm.txt --interval 0.1 $(ps aux | grep conference_service_micronaut | grep -v 'grep' | awk '{print $2}')
fi