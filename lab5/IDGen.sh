#!/bin/bash


##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Feb.26/25
#  Course: CMPT220 X02L Lab5
#  Make sure you run chmod +x  
##################################################



# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filename> <interface name>"
    exit 1
fi

filename="$1"
interface="$2"

# Get the hostname
host=$(hostname)

# Extract the MAC address for the given interface
macAddy=$(grep -A 5 "$2" "$1" | grep ether | cut -d ' ' -f2 )



# Construct the string
dataStr="$host\\$macAddy"

echo "Data used to generate ID: $dataStr"

# Generate the MD5 hash and extract the first 6 bytes
md5_hash=$(echo -n "$dataStr" | md5sum | awk '{print $1}')
generated_code=${md5_hash:0:6}

echo "The generated code: $generated_code"
