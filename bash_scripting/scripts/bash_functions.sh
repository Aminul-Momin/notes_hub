#! bin/bash


simple_for(){
    echo "$0"
    count=0
    for i in $(cat ./bash_functions.sh); do
        count=$((count + 1))
        echo "Word $count ($i) contains $(echo -n $i | wc -c) characters"
    done
}

draw_line(){
    printf "%$(tput cols)s\n"|tr " " "."
}