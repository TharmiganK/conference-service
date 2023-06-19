#!/bin/bash

echo "RSS after start up"
if [ "$1" = "docker" ];
then
    sh ./rss.sh now docker
else
    sh ./rss.sh now
fi

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "WSO2Con"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code"
echo "Response Time 1: $response_time"
echo ""

echo "RSS after first request"
if [ "$1" = "docker" ];
then
    sh ./rss.sh now docker
else
    sh ./rss.sh now
fi

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "Strata"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code"
echo "POST Response Time 2: $response_time"
echo ""

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "KubeCon"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code"
echo "POST Response Time 3: $response_time"
echo ""


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code"
echo "GET Response Time 4: $response_time"
echo ""

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code"
echo "GET Response Time 5: $response_time"
echo ""

echo "RSS after five requests"
if [ "$1" = "docker" ];
then
    sh ./rss.sh now docker
else
    sh ./rss.sh now
fi

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "IBM Think"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code"
echo "Response Time 1: $response_time"
echo ""

echo ""
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "Microsoft Ignite"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code"
echo "POST Response Time 2: $response_time"
echo ""

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "MS Build"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code"
echo "POST Response Time 3: $response_time"
echo ""


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code"
echo "GET Response Time 4: $response_time"
echo ""

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code"
echo "GET Response Time 5: $response_time"
echo ""

echo "RSS after ten requests"
if [ "$1" = "docker" ];
then
    sh ./rss.sh now docker
else
    sh ./rss.sh now
fi
