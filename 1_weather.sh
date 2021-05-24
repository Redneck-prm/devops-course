#!/bin/bash

file="/tmp/weather.txt"

curl -s wttr.in/${1}?format=j1 > $file
temperature=`jq '.current_condition | .[] | .temp_C'  $file`
temperature=`echo $temperature | sed 's/.\(.*\)/\1/' | sed 's/\(.*\)./\1/'`

humidity=`jq '.current_condition | .[] | .humidity' $file`
humidity=`echo $humidity | sed 's/.\(.*\)/\1/' | sed 's/\(.*\)./\1/'`

echo $temperature $humidity

rm $file