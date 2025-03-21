#!/bin/bash


##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Feb.12/25
#  Course: CMPT220 X02L 
#  Note: I HAD TO RUN chmod +x get_index.sh TO GET THIS SCRIPT TO WORK
#
##################################################

# Ensure at least two arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 search_value list_of_values"
    exit 1
fi

search_value=$1
shift  # Remove first argument

index=0
for value in "$@"; do
    if [ "$value" == "$search_value" ]; then
        echo "$index"
        exit 0
    fi
    ((index++))
done

echo "-1"
exit 1
