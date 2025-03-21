#!/bin/bash


##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Mar. 5/25
#  Course: CMPT220 X02L A2
#  Make sure you run chmod +x  
##################################################


#!/bin/bash

# Check if any arguments are provided
if [ $# -eq 0 ]; then
    echo "usage: $(basename "$0") search_term..." 
    echo "Find every user that has all of the case-insensitive unordered search" 
    echo "terms present in his/her account's comment field." 
    exit 1
fi

# 
testA=()

for term in "$@"; do
    testStr=$(getent passwd | sort -u | cut -d ':' -f 1,5 | cut -d ',' -f1 | grep -i "$1" | grep -i "$2" | sed 's/:/,/')
    testA+=($testStr)
done

echo "$testStr" | sed 's/ / /g' | sed 's/\(.*\),\(.*\)/\1, \2/'
