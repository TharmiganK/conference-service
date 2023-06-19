#!/bin/bash

if [ "$1" = "graalvm" ];
then
    ./mvnw clean install -Dnative -Dquarkus.native.builder-image=graalvm
else
    ./mvnw clean package -Dquarkus.package.type=uber-jar
fi

# sleep 5

# if [ "$1" = "graalvm" ];
# then
#     ./target/conference_service_quarkus-1.0.0-runner
# else
#     java -jar ./target/conference_service_quarkus-1.0.0-runner.jar
# fi
