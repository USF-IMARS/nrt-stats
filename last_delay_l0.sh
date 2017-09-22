#!/bin/bash

printf "{\n"

last_file="$(/opt/nrt-stats/get_last_file.sh level0 *.PDS)"
#echo "lastfile is ${last_file}"
last_delay="$(/opt/nrt-stats/get_delay_for.py $last_file)"

printf "\t\"ipopp.delay.l0\": $last_delay\n"

printf "}\n"

