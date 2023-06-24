#!/bin/bash

./mvnw clean

if [ "$1" = "graalvm" ];
then
    ./mvnw install -Dnative -Dquarkus.native.builder-image=graalvm
else
    ./mvnw package -Dquarkus.package.type=uber-jar
fi

# sleep 5

# if [ "$1" = "graalvm" ];
# then
#     ./target/conference_service_quarkus-1.0.0-runner
# else
#     java -jar ./target/conference_service_quarkus-1.0.0-runner.jar
# fi
