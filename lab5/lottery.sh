#!/bin/bash


##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Feb.26/25
#  Course: CMPT220 X02L Lab5
#  Make sure you run chmod +x  
##################################################


# Generate empty array
declare -A numbers


# while the number of indexes in the array < 7
while [ "${#numbers[@]}" -lt 7 ]; do

    # generate random num
    num=$(dd if=/dev/random bs=1 count=1 status=none | od -A n -t u1)

    # ensure number < 50, regenerate until
    while [ "$num" -ge 50 ]; do
        num=$(dd if=/dev/random bs=1 count=1 status=none | od -A n -t u1)
    done

    numbers[$num]=1  # <-- Stores the number as the array index as opposed to the array value (ENSURES UNIQUE NUMBER)

done

# print array index numbers, (THE !numbers is for, ! dne not in bash in this case)
printf "%s" "${!numbers[@]}" 
echo
