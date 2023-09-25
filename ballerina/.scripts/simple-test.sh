# !/bin/bash

sleep 30

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
echo "GET /conferences Response Code: $response_code"
if [ "$response_code" != "200" ]; then
    exit 1
fi

curl_response=$(curl -X POST -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences --header 'Content-Type: application/json' --data '{"name": "WSO2Con", "id": "CONF-2022-001"}')
response_code=$(echo "$curl_response" | awk '{print $1}')
echo "POST /conferences Response Code: $response_code"
if [ "$response_code" != "202" ]; then
    exit 1
fi

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferences)
response_code=$(echo "$curl_response" | awk '{print $1}')
echo "GET /conferences Response Code: $response_code"
if [ "$response_code" != "200" ]; then
    exit 1
fi

curl_response=$(curl -s -w "%{http_code} %{time_total}\n" -o /dev/null http://localhost:8102/conferenceswithcountry)
response_code=$(echo "$curl_response" | awk '{print $1}')
echo "GET /conferenceswithcountry Response Code: $response_code"
if [ "$response_code" != "200" ]; then
    exit 1
fi

sleep 5
pkill -f conference_service_ballerina
