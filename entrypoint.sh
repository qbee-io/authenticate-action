#!/bin/sh -l

qbee-cli login --email "$INPUT_LOGIN" --password "$INPUT_PASSWORD" -b "https://$INPUT_API_HOST"
