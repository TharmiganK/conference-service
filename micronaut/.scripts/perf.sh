#!/bin/bash

wrk -t5 -c100 -d3m http://localhost:8101/conferences > ../.results/throughput.txt

sleep 30

wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8101/conferences > ../.results/latency.txt

sleep 30

if [ "$1" = "graalvm" ]; then 
    mv ../.results/throughput.txt ../.results/throughput-graalvm.txt
    mv ../.results/latency.txt ../.results/latency-graalvm.txt
else
    mv ../.results/throughput.txt ../.results/throughput-jvm.txt
    mv ../.results/latency.txt ../.results/latency-jvm.txt
fi

pkill -f conference_service_micronaut
