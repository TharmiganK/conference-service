#!/bin/bash

echo "conference-service started at $(docker container inspect --format '{{ .State.StartedAt }}' conference-service-ballerina)"
