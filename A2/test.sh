#!/bin/bash


##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Mar. 5/25
#  Course: CMPT220 X02L A2
#  Make sure you run chmod +x  
##################################################


#!/bin/bash

declare -A userLines
#ps -A -o uid,etime,user
#ps -A -o uid,etime,user --no-headers | awk '{print $1, $2, $3}'

ps -A -o etime,uid,user --no-headers| while read etime uid user
do
    #echo "Elapsed time: $etime, UID: $uid, User: $user"
    echo $uid
    userLines[$uid]=1
done



# Print the array keys (UIDs)
echo "Array: "
for uid in "${!userLines[@]}"; do
    echo "UID: $uid, User: ${userLines[$uid]}"
done



convertToSeconds() {
    local etime=$1
    local minutes=$(echo "$etime" | cut -d ':' -f 1)
    local seconds=$(echo "$etime" | cut -d ':' -f 2)

    # Remove leading zeros to avoid octal interpretation
    minutes=${minutes#0}
    seconds=${seconds#0}

    # Convert everything to seconds
    echo $((10#$minutes * 60 + 10#$seconds))
}