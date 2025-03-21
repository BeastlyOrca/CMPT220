#!/bin/bash

##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Feb.12/25
#  Course: CMPT220 X02L
#  Note: I HAD TO RUN chmod +x get_index.sh TO GET THIS SCRIPT TO WORK
#
##################################################

firstArg=$1
index=0
shift

for num in "$@"; do
    if ((num == firtstArg)); then
    echo "$index" 
    exit 0
    fi
((index++))
done


echo "-1"
exit 1

