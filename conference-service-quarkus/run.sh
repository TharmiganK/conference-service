#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./target/conference_service_quarkus-1.0.0-runner &
else
    java -jar ./target/conference_service_quarkus-1.0.0-runner.jar &
fi

pid=$!
echo ""
echo "[INFO] process started with PID $pid"
echo ""

stop_process() {
  kill $pid
  exit 0
}
trap stop_process INT
wait $pid
