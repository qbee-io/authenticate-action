#!/bin/sh

login=$1
password=$2
api_host=$3

echo "init login $login and password $password on $api_host"

qbee-cli login -u $login -p $password -b https://$api_host
