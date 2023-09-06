#!/bin/bash

wrk -t5 -c100 -d3m http://localhost:8102/conferences

sleep 60

wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8102/conferences

sleep 10

pkill -f conference_service_ballerina
