#!/bin/bash


##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Feb.12/25
#  Course: CMPT220 X02L 
#
##################################################


greet() {
    if [ $# == 1 ]; then
        echo "hello, $1"
    else
        echo "usage: ${FUNCNAME[0]} name"
    fi
}



# multiplyints function

multiplyints() {
    local result=1
    for num in "$@"; do
        result=$((result * num))
    done
    echo "$result"
}


# Define the calcsum function using tr to format input
# SYNTAX: $ tr [OPTION] SET1 [SET2]
# Examples: cat greekfile | tr [a-z] [A-Z]    <-- LOWERCASE TO UPPER
# $ echo "12+5" | bc   <-- Outputs 17

calcsum() {
    sum=$(echo "$@" | tr ' ' '+' | bc)
    echo "The result is $sum"

}






