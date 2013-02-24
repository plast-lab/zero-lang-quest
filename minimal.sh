#!/bin/bash

i=0
while read line; do
    IFS='|' read -a p <<< "$line"
    lines[$i]=$line
    ((i++))
    if [ -z ${vals[${p[1]}]} ];
    then
	vals[${p[1]}]=${p[0]}
    elif [ ${vals[${p[1]}]} != ${p[0]} ];
    then
	vals[${p[1]}]="true"
    fi
done < "${1:-/proc/${$}/fd/0}"

for ((i=0; i < "${#lines[@]}"; i++))
do
    IFS='|' read -a p <<< "${lines[$i]}"
    if [ ${vals[${p[1]}]} == "true" ];
    then
	echo ${p[0]}"|"${p[1]}
    fi
done
