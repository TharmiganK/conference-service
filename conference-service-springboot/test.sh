#!/bin/bash

echo "Memory usage after start up" >> test.txt
sh ./rss.sh now >> test.txt

echo "" >> test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences --header 'Content-Type: application/json' --data '{"name": "WSO2Con"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code" >> test.txt
echo "Response Time 1: $response_time" >> test.txt
echo "" >> test.txt

echo "Memory usage after first request" >> test.txt
sh ./rss.sh now >> test.txt

echo "" >> test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences --header 'Content-Type: application/json' --data '{"name": "Strata"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code" >> test.txt
echo "POST Response Time 2: $response_time" >> test.txt
echo "" >> test.txt

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences --header 'Content-Type: application/json' --data '{"name": "KubeCon"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code" >> test.txt
echo "POST Response Time 3: $response_time" >> test.txt
echo "" >> test.txt


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code" >> test.txt
echo "GET Response Time 4: $response_time" >> test.txt
echo "" >> test.txt

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code" >> test.txt
echo "GET Response Time 5: $response_time" >> test.txt
echo "" >> test.txt

echo "Memory usage after five requests" >> test.txt
sh ./rss.sh now >> test.txt

echo "" >> test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences --header 'Content-Type: application/json' --data '{"name": "IBM Think"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "Response Code 1: $response_code" >> test.txt
echo "Response Time 1: $response_time" >> test.txt
echo "" >> test.txt

echo "" >> test.txt
curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences --header 'Content-Type: application/json' --data '{"name": "Microsoft Ignite"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 2: $response_code" >> test.txt
echo "POST Response Time 2: $response_time" >> test.txt
echo "" >> test.txt

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences --header 'Content-Type: application/json' --data '{"name": "MS Build"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "POST Response Code 3: $response_code" >> test.txt
echo "POST Response Time 3: $response_time" >> test.txt
echo "" >> test.txt


curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 4: $response_code" >> test.txt
echo "GET Response Time 4: $response_time" >> test.txt
echo "" >> test.txt

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8103/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
response_time=$(echo "$curl_response" | awk '{print $2}')
echo "GET Response Code 5: $response_code" >> test.txt
echo "GET Response Time 5: $response_time" >> test.txt
echo "" >> test.txt

echo "Memory usage after ten requests" >> test.txt
sh ./rss.sh now >> test.txt

if [ "$1" = "graalvm" ] || [ "$2" = "graalvm" ]; then
    cat test.txt >> test-graalvm.txt
else
    cat test.txt >> test-jvm.txt
fi
rm test.txt

if [ "$1" = "stop" ] || [ "$2" = "stop" ]; 
then
    sleep 5
    pkill -f conference_service_springboot
fi
