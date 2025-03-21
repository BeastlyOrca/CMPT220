#!/bin/bash

##################################################
#
#  Author: Nadir Bakridi 3084652
#  Date: Mar. 5/25
#  Course: CMPT220 X02L A2
#  Make sure you run chmod +x  
##################################################

# Check if datebook exists
checkFile() {

    if [ -f datebook.txt ]; then
        echo "File exists"
    else
        echo "File does not exist"
    fi
}

# 1. [1 point] Change Tommy’s name to Tom.
changeName() {
    sed 's/Tommy/Tom/g' datebook.txt > output.txt
    #sed -i 's/Tommy/Tom/g' datebook.txt > output.txt   THIS ONES FOR CHANGING FILE (REMOVE > OUTPUT)
}

# 2. [1 point] Delete the last five lines.
lastLines() {

    cp datebook.txt output.txt  # avoid modifying the original file

    for i in {1..5}; do  # Delete 5 lines
        sed -i '$d' output.txt  # Modify the file in-place
    done
}

# 3. [1 point] Print (only) lines 3 through 7.
printLines(){
    sed -n '3,7p' datebook.txt
}

# 4. [1 point] Delete lines containing Ave.
deleteLines() {
    sed '/Ave\./d' datebook.txt > output.txt
}

# 5. [1 point] Print all lines where the birthdays are in April or July.
printBday() {
    # /:(4|7)\/
    #sed -n '/^[^:]*:[^:]*:[^:]*:\(4\/\|7\/\)/p' datebook.txt
    sed -n -r '/:(4|7)\//p' datebook.txt
}

# 6. [1.5 points] Append three stars to the begin of lines ending with 68900.
addStars() {
    sed -E 's/^(.*:68900)$/\*\*\*\1/' datebook.txt > output.txt
}

# 7. [1 point] Replace the line containing Jose with JOSE HAS RETIRED. Be sure to replace the 
retired() {
    #sed 's/Jose/JOSE HAS RETIRED/' datebook.txt > output.txt
    sed 's/^.*Jose.*$/JOSE HAS RETIRED/' datebook.txt > output.txt
}

# 8. [1.5 points] Change Popeye’s birthday to 11/14/46.
popeyes() {
    #sed 's/\(Popeye:[^:]*:[^:]*:[^:]*:\)[^:]*\(:.*\)/\1 11\/14\/46\2/' datebook.txt > output.txt
    # since 29358 is unique to popeye, just search for that
    sed 's/\(29358:[0-9]*\/[0-9]*\/[0-9]*\)/29358:11\/14\/46/' datebook.txt > output.txt
    #sed 's/Popeye

}

# 9. [1 point] Insert 5 blank spaces at beginning of each line.
blanks() {
    sed 's/^/     /' datebook.txt > output.txt
}



# insert, remove, print, and append
applySED() {
    
    # Insert above the first line the title PERSONNEL FILE
    sed '1i\PERSONNEL FILE' datebook.txt > output.txt

    # Remove lines ending in 500
    sed '/500$/d' output.txt > output2.txt

    # Print the contents of the file with the last names and first names reversed
    sed 's/\([^:]*\) \([^:]*\):/\2 \1:/' output2.txt > output3.txt  # Fixed: Reversed only the names
    # sed -r '/^.*$/s/(^[A-Z]*[a-z]*) ([A-Z]*[a-z])/\2 \1/' output2.txt > output3.txt

    # Append at the end of the file THE END
    echo "THE END" >> output3.txt

}

applySED
