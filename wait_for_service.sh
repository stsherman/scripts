#!/usr/bin/env bash

DEFAULT_MAX_ATTEMPTS=120

while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi
  shift
done

MAX_ATTEMPTS=${max_attempts:-$DEFAULT_MAX_ATTEMPTS}
SERVICE_NAME=$service_name

attempts=0
while [[ `ps -ef | grep -v grep | grep $SERVICE_NAME | wc -l` -eq 0 ]]; do
    sleep 1
    ((attempts++))
    if [[ $attempts -gt $MAX_ATTEMPTS ]]; then
    	echo "Pulseaudio did not start within allotted time"
    	exit 1
    fi
done
