#!/bin/bash

../perf/wrk -t5 -c100 -d3m http://localhost:8101/conferences

sleep 60

../perf/wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8101/conferences

pkill -f conference_service_micronaut
