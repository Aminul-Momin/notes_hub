#!/bin/bash



check_vars(){
    for i in "$@"; do
        echo $i
    done
}

check_if2(){
    for filename in "$@"; do
        result=
        if [ -f "$filename" ]; then
            result="$filename is a regular file"
        else
            if [ -d "$filename" ]; then
                result="$filename is a directory"
            fi
        fi
        if [ -w "$filename" ]; then
            result="$result and it is writable"
        else
            result="$result and it is not writable"
        fi
        echo "$result"
    done
}

check_if_cond(){
    # Check for required arguments
    if [ $# -ne 2 ]; then
        echo "usage: $0 directory_1 directory_2" 1>&2
        exit 1
    fi

    # Make sure both arguments are directories
    if [ ! -d "$1" ]; then
        echo "$1 is not a directory!" 1>&2
        exit 1
    fi

    if [ ! -d "$2" ]; then
        echo "$2 is not a directory!" 1>&2
        exit 1
    fi

    read -p "Enter a number between 1 and 3 inclusive > " character
    if [ "$character" = "1" ]; then
        echo "You entered one."
    elif [ "$character" = "2" ]; then
        echo "You entered two."
    elif [ "$character" = "3" ]; then
        echo "You entered three."
    else
        echo "You did not enter a number between 1 and 3."
    fi
}

proc_file_dire(){
    # Process each file in directory_1, comparing it to directory_2
    missing=0
    for filename in "$1"/*; do
        fn=$(basename "$filename")
        if [ -f "$filename" ]; then
            if [ ! -f "$2/$fn" ]; then
                echo "$fn is missing from $2"
                missing=$((missing + 1))
            fi
        fi
    done
    echo "$missing files missing"
}

simple_while(){
    ## While LOOP:


    # The `-r` option passed to read command prevents backslash escapes from being interpreted.
    # Add `IFS= ` option before read command to prevent leading/trailing whitespace from being trimmed -
    input="/path/to/txt/file"
    while IFS= read -r line
    do
    echo "$line"
    done < "$input"


    cat file.txt | while read line; do
        echo $line
    done


    number=0
    while [ "$number" -lt 10 ]; do
        echo "Number = $number"
        number=$((number + 1))
    done
}