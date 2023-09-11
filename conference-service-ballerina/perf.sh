#!/bin/bash

wrk -t5 -c100 -d3m http://localhost:8102/conferences > throughput.txt

sleep 60

wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8102/conferences > latency.txt

sleep 45

if [ "$1" = "graalvm" ]; then 
    mv throughput.txt throughput-graalvm.txt
    mv latency.txt latency-graalvm.txt
else
    mv throughput.txt throughput-jvm.txt
    mv latency.txt latency-jvm.txt
fi

pkill -f conference_service_ballerina
