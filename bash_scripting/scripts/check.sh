#!bin/bash

function main(){
    check $@
    
    if [ $m ] then
        echo "'m' has been chosen."
    fi
}

check(){
    local OPTIND opt i 
    
    while getopts ":cmni:" opt; do
        case $opt in 
            i) echo "You chose 'i'";input="$OPTARG";;
            c) echo "'c' is a good option.";;
            m) m=true;;
            n) n_func;;
            \?) help;exit 1;;
        esac
    done
    
    shift $((OPTIND -1))
    if [ "$input" = "" ] then
        echo "No input files" else
        echo "Input is $input"
    fi
}

function help(){
    echo $1
    echo "Help. I need help"
}

function n_func(){
    echo "This is the n_func."
}

