#!/bin/bash

docker run --name conference-service-quarkus --network=host --rm $(id -un)/conference_service_quarkus:1.0.0
