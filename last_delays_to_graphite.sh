#!/bin/bash
HOSTNAME=`hostname -s`
SERVER=graphite
PORT=2003

last_file="$(/opt/nrt-stats/get_last_file.sh level0 *.PDS)"
last_delay="$(/opt/nrt-stats/get_delay_for.py $last_file)"

       echo "$HOSTNAME.exec.ipopp.delay.l0 $last_delay `date +%s`"
nc -c 'echo "$HOSTNAME.exec.ipopp.delay.l0 $last_delay `date +%s`"' $SERVER $PORT
