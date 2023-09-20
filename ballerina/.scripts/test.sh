#!/bin/bash

sleep 5

echo "Memory usage after start up" >> ../.results/test.txt
sh ./rss.sh now >> ../.results/test.txt

echo "" >> ../.results/test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "QCon", "id": "CONF-2022-001"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code" >> ../.results/test.txt
echo "Response Time 1: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

echo "Memory usage after first request" >> ../.results/test.txt
sh ./rss.sh now >> ../.results/test.txt

echo "" >> ../.results/test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "Strata", "id": "CONF-2021-002"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code" >> ../.results/test.txt
echo "POST Response Time 2: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "KubeCon", "id": "CONF-2023-003"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code" >> ../.results/test.txt
echo "POST Response Time 3: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code" >> ../.results/test.txt
echo "GET Response Time 4: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code" >> ../.results/test.txt
echo "GET Response Time 5: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

echo "Memory usage after five requests" >> ../.results/test.txt
sh ./rss.sh now >> ../.results/test.txt

echo "" >> ../.results/test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "IBM Think", "id": "CONF-2021-004"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code" >> ../.results/test.txt
echo "Response Time 1: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

echo "" >> ../.results/test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "Microsoft Ignite", "id": "CONF-2022-005"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code" >> ../.results/test.txt
echo "POST Response Time 2: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "MS Build", "id": "CONF-2023-006"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code" >> ../.results/test.txt
echo "POST Response Time 3: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code" >> ../.results/test.txt
echo "GET Response Time 4: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code" >> ../.results/test.txt
echo "GET Response Time 5: $response_time" >> ../.results/test.txt
echo "" >> ../.results/test.txt

echo "Memory usage after ten requests" >> ../.results/test.txt
sh ./rss.sh now >> ../.results/test.txt

if [ "$1" = "graalvm" ] || [ "$2" = "graalvm" ]; then
    cat ../.results/test.txt >> ../.results/test-graalvm.txt
else
    cat ../.results/test.txt >> ../.results/test-jvm.txt
fi
rm ../.results/test.txt

if [ "$1" = "stop" ] || [ "$2" = "stop" ]; 
then
    sleep 5
    pkill -f conference_service_ballerina
fi
