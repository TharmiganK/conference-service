#!/bin/bash

if [ "$1" = "graalvm" ]; then
    psrecord --plot ../.results/plot-graalvm.png --log ../.results/log-graalvm.txt --interval 0.1 $(ps aux | grep conference_service_springboot | grep -v 'grep' | awk '{print $2}')
else
    psrecord --plot ../.results/plot-jvm.png --log ../.results/log-jvm.txt --interval 0.1 $(ps aux | grep conference_service_springboot | grep -v 'grep' | awk '{print $2}')
fi