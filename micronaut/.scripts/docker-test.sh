#!/bin/bash

echo "Memory usage after start up"
sh ./docker-stats.sh now conference-service-micronaut

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences --header 'Content-Type: application/json' --data '{"name": "WSO2Con"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code"
echo "Response Time 1: $response_time"
echo ""

echo "Memory usage after first request"
sh ./docker-stats.sh now conference-service-micronaut

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences --header 'Content-Type: application/json' --data '{"name": "Strata"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code"
echo "POST Response Time 2: $response_time"
echo ""

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences --header 'Content-Type: application/json' --data '{"name": "KubeCon"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code"
echo "POST Response Time 3: $response_time"
echo ""


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code"
echo "GET Response Time 4: $response_time"
echo ""

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code"
echo "GET Response Time 5: $response_time"
echo ""

echo "Memory usage after five requests"
sh ./docker-stats.sh now conference-service-micronaut

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences --header 'Content-Type: application/json' --data '{"name": "IBM Think"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code"
echo "Response Time 1: $response_time"
echo ""

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences --header 'Content-Type: application/json' --data '{"name": "Microsoft Ignite"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code"
echo "POST Response Time 2: $response_time"
echo ""

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences --header 'Content-Type: application/json' --data '{"name": "MS Build"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code"
echo "POST Response Time 3: $response_time"
echo ""


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code"
echo "GET Response Time 4: $response_time"
echo ""

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8101/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code"
echo "GET Response Time 5: $response_time"
echo ""

echo "Memory usage after ten requests"
sh ./docker-stats.sh now conference-service-micronaut

if [ "$1" = "stop" ]; then
    echo ""
    echo "Stopping container"
    sleep 5
    docker stop conference-service-micronaut
fi
