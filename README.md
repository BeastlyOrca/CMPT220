# CMPT220
Codespace By Nadir Bakridi

Basics
    - unix has good command line interface
    - epoch time (usually starts when created file starting point) 14964/360 <- not sure what this is to get years in epoch
    - mkdir -p first/second/third       <--- Command will create a folder with subsequent folders in them
    - ln -s mainfile.ext newfile.ext to create a symbolic link from 2nd file to 1st
    - if removing a file, a hardlinked file will still exist
    -rw = file
    drw = directory
    - to take permissions away: chmod u-x file
    - touch file1.txt || to create file
    - for multiple file creation: echo file{1,2,3}.txt
    - for large number: echo file{1..50}.txt for 50 files
    - for large number: touch file{1..50.3}.txt for 50 files 
    - globing(*) and wildcard(?): find files with specific names: ls file2??.* = all files that are greater than 200 in 
      name
    - sleep 5 & <-- ampersand gives job num and process num
    - $ set -o noclobber <-- lookup what this does
    - pipes connect stdout of a potential program into the stdin of another

    VIM: 
    - :qa to exit vim
    - :wq save and exit
    - / to search, eg. /if <- to find if in vim
    - in loops, can use shift to put the next arg into $1 register
    - $/hello/mello to change hello to mello
    - bc is an interactive calculator


    - ls -ah to find hidden files

    if [-r "data.txt."] && [-w "data.txt"].  <-- if  readable and writeable file 


    when using regex (registered expression)
    - colou?r.  <-- will find colour with both u and w/o it.
    - ket.$. <-- finds ending in ket.  (ex crickets.)
    - [01]+ accepts all strings with 0 and 1's in them
    - ^"string" <-- string starts with
    - "string"$ <-- string ends with 
    - ^[01]*0$. <-- anything befor * can come 0 or more times 
    - /w for characters


  AWK
    -  -F "[, ]+"'/George|^john/{prints $NF ":", $1. $(NF-1)}'




    
