#!/bin/bash

echo "Building the Ballerina application"
echo ""
bal build

echo ""
echo "Executing the Ballerina application"
echo ""

# Retrieve the start time in UTC
start_time=$(gdate +"%Y-%m-%dT%H:%M:%S.%3N")

# Print the start time
echo "time = $start_time+05:30 level = INFO module = user/conference_service_ballerina message = Execution started"

# Execute the 'java -jar' command in the background
java -jar target/bin/conference_service_ballerina.jar 
