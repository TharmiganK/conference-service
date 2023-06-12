#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./mvnw clean package -Dpackaging=native-image
else
    ./mvnw clean package
fi

# sleep 5

# if [ "$1" = "graalvm" ];
# then
#     ./target/conference_service_micronaut &
# else
#     java -jar ./target/conference_service_micronaut-1.0.jar &
# fi

# pid=$!
# echo ""
# echo "[INFO] process started with PID $pid"
# echo ""

# stop_process() {
#   kill $pid
#   exit 0
# }
# trap stop_process INT
# wait $pid
