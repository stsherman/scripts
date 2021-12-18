#!/usr/bin/env bash

wait_for_service.sh --max_attempts 120 --service_name pulseaudio || exit 1
echo "Pulseaudio started"

DEFAULT_SINK=`pactl list short sinks | grep output | grep Logi | awk '{ print $2 }'`
DEFAULT_SOURCE=`pactl list short sources | grep input | grep Blue | awk '{ print $2 }'`

while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi
  shift
done

SINK=${output:-$DEFAULT_SINK}
SOURCE=${input:-$DEFAULT_SOURCE}

pactl set-default-sink $SINK
pactl set-default-source $SOURCE

echo "Default audio devices set"
echo "	Input: $SOURCE"
echo "	Output: $SINK"
