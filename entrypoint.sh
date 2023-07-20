#!/bin/sh -l

login=$1
password=$2
api_host=$3

echo "init login $login and password $password on $api_host"

successful_status_code='200'

output=$(curl --request POST -sL --url "https://$api_host/api/v2/login" \
        --header "Content-Type: application/json" \
        -d "{\"email\":\"$login\",\"password\":\"$password\"}" \
        -w "\n{\"http_code\":%{http_code}}\n")

http_code=$(echo $output | jq -cs | jq -r '.[1].http_code')

if [ "$http_code" != "$successful_status_code" ]; then
    echo "http_code was - $http_code"
    exit 1
else
    echo 'successful authentication'
fi

tokenValue=$(echo $output | jq -cs | jq -r '.[0].token')

#echo "::set-output name=token::$tokenValue"
echo "token=$tokenValue" >> $GITHUB_OUTPUT

