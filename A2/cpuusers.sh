#!/bin/bash

##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Mar. 5/25
#  Course: CMPT220 X02L A2
#  Make sure you run chmod +x  
##################################################

# Function to convert etime to total seconds
convertToSeconds() {
    local etime=$1

    # Split the input into days, hours, minutes, and seconds
    if [[ "$etime" =~ ^([0-9]+)-([0-9]{2}):([0-9]{2}):([0-9]{2})$ ]]; then

        # Format: DD-HH:MM:SS
        local days=$(echo "$etime" | cut -d '-' -f 1)
        local hours=$(echo "$etime" | cut -d '-' -f 2 | cut -d ':' -f 1)
        local minutes=$(echo "$etime" | cut -d ':' -f 2)
        local seconds=$(echo "$etime" | cut -d ':' -f 3)

        # Remove leading zeros to avoid octal interpretation
        days=${days#0}
        hours=${hours#0}
        minutes=${minutes#0}
        seconds=${seconds#0}

        # Convert everything to seconds
        echo $((10#$days * 86400 + 10#$hours * 3600 + 10#$minutes * 60 + 10#$seconds))
        #echo $((10#$minutes * 60 + 10#$seconds))

   elif [[ "$etime" =~ ^([0-9]{2}):([0-9]{2}):([0-9]{2})$ ]]; then

    # Format: HH:MM:SS
    local hours=$(echo "$etime" | cut -d ':' -f 1)
    local minutes=$(echo "$etime" | cut -d ':' -f 2)
    local seconds=$(echo "$etime" | cut -d ':' -f 3)

    # Remove leading zeros to avoid octal interpretation
    hours=${hours#0}
    minutes=${minutes#0}
    seconds=${seconds#0}

    # Convert everything to seconds
    echo $((10#$hours * 3600 + 10#$minutes * 60 + 10#$seconds))

    elif [[ "$etime" =~ ^([0-9]{2}):([0-9]{2})$ ]]; then
        local minutes=$(echo "$etime" | cut -d ':' -f 1)
        local seconds=$(echo "$etime" | cut -d ':' -f 2)

        # Remove leading zeros to avoid octal interpretation
        minutes=${minutes#0}
        seconds=${seconds#0}

        # Convert everything to seconds
        echo $((10#$minutes * 60 + 10#$seconds))

    else
        echo "Invalid time format: $etime"
        return 1
    fi

    # Remove leading zeros to avoid octal interpretation
    #days=${days#0}
    #hours=${hours#0}
    #minutes=${minutes#0}
    #seconds=${seconds#0}

    # Convert everything to seconds
    #echo $((10#$days * 86400 + 10#$hours * 3600 + 10#$minutes * 60 + 10#$seconds))
}

# Function to convert seconds to hh:mm:ss format
convertFromSeconds() {
    local secSum=$1
    local hours=$((secSum/3600))            # hours = sum / 3600 
    local minutes=$(((secSum%3600)/60))     # mins = (sum % 3600) / 60
    local seconds=$((secSum%60))            # seconds = sum % 60
    printf "%02d:%02d:%02d\n" "$hours" "$minutes" "$seconds"
}

declare -A userNames
declare -A userTime

# Use process substitution to avoid subshell
while read -r etime uid user; do

    # Convert etime to seconds using the function
    etime_seconds=$(convertToSeconds "$etime")

    # Store user name and sum etime
    userNames[$uid]=$user
    userTime[$uid]=$((userTime[$uid] + etime_seconds))   # if time already exits, adds new time, otherwise inits to 0 + etime

# https://unix.stackexchange.com/questions/440088/what-is-command-substitution-in-a-shell
done < <(ps -A -o etime,uid,user --no-headers --sort=-etime) # this is used in order to parse the ps command, line by line, instead of all at once (process substitution)


# Sort UIDs based on the total elapsed time
sortedUids=($(for uid in "${!userTime[@]}"; do
    echo "$uid ${userTime[$uid]}"         # extract the uid and time in order to sort
done | sort -k2 -nr | awk '{print $1}'))  # Extract only the UIDs sorted by time

# Print sorted results by uid
#printf "%-16s %-20s %s\n" "UID" "TIME" "USERNAME"
for uid in "${sortedUids[@]}"; do
    formatTime=$(convertFromSeconds "${userTime[$uid]}")
    printf "%-16s %-20s %s\n" "$uid" "$formatTime" "${userNames[$uid]}"
done