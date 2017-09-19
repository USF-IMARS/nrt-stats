
printf "{\n"
last_file="$(/root/nrt-stats/get_last_file.sh)"
#echo "lastfile is ${last_file}"
last_delay="$(/root/nrt-stats/get_delay_for.py $last_file)"


printf "\"ipopp.delay.l0\": $last_delay,\n"

printf "}\n"

