#!/bin/bash

wrk -t5 -c100 -d3m http://localhost:8103/conferences

sleep 60

wrk2 -t5 -c100 -d3m -R1000 --latency http://localhost:8103/conferences

pkill -f conference_service_springboot
