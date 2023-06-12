#!/bin/bash

# Check if process ID is provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide the process ID as an argument."
  exit 1
fi

# Main script logic
while true; do
  # Get the RSS value for the process ID in kilobytes
  rss=$(ps -p $1 -o rss=)
  
  # Check if process ID is valid
  if [ -z "$rss" ]; then
    echo "Error: Invalid process ID."
    exit 1
  fi
  
  # Convert RSS to megabytes
  rss_mb=$(bc <<< "scale=2; $rss / 1024")
  
  # Print the RSS value in MB
  echo "RSS of process $1: $rss_mb MB"
  
  # Sleep for 1 second
  sleep 1
done
