#!/bin/bash



function main(){
    check $@
    
    if [ $m ]; then
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
    if [ "$input" = "" ]; then
        echo "No input files" else
        echo "Input is $input"
    fi
}

# main "i"


# # Function to rsync the document folder to a flash drive based on the target value
function sync_to_volume() {
    local target="$1"
    local source_folder="/path/to/document/folder"  # Replace this with the actual path to your document folder

    case "$target" in
        "mypassport")
        echo "mypassport is chosen"
            # rsync -avz --exclude '.venv' --exclude 'venv*' --exclude 'node_modules' --exclude '.ipynb_checkpoints' --exclude '.egg-info' --exclude '*.egg-info' --exclude '*.class' --exclude '*.DS_Store' --exclude '.pytest_cache' --exclude '__pycache__' $HOME/mydocs/ /Volumes/mypassport/MYDOCS_BACKUP/
            ;;
        "mc01")
        echo "mypassport is mc01"
            # rsync -avz --exclude '.venv' --exclude 'venv*' --exclude 'node_modules' --exclude '.ipynb_checkpoints' --exclude '.egg-info' --exclude '*.egg-info' --exclude '*.class' --exclude '*.DS_Store' --exclude '.pytest_cache' --exclude '__pycache__' $HOME/mydocs/ /Volumes/Momin-MC01/MYDOCS_BACKUP/
            ;;
        *)
            echo "Invalid target. Please choose one of: mypassport, mc01, target3."
            ;;
    esac
}

# Usage example:
# Call the function with the desired target value as an argument (e.g., "target1")
# sync_to_volume "target1"

demo_getopts1(){
    options=$(getopt -o "abc:" -l "alpha,bravo,charlie:" -- "$@")
    eval set -- "$options"

    while true; do
        case "$1" in
            -a|--alpha)
                echo "Option -a or --alpha is set"
                shift ;;
            -b|--bravo)
                echo "Option -b or --bravo is set"
                shift ;;
            -c|--charlie)
                echo "Option -c or --charlie is set with argument: $2"
                shift 2 ;;
            --)
                shift
                break ;;
        esac
    done

    echo "Non-option arguments:"
    for arg do
        echo "$arg"
    done
}


getopts_demo01() {
  : '
  Usages:
    getopts_demo01 -o/--outputfile output_file -i/--inputfile input_file pysh
  '

  local argument
  local output_file
  local input_file

  while getopts "o:i:" opt; do
    case $opt in
      o | --outputfile)
        output_file=$OPTARG
        echo "Output File: $output_file"
        ;;
      i | --inputfile)
        input_file=$OPTARG
        echo "Input File: $input_file"
        ;;
      *)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
    esac
  done
  shift $((OPTIND - 1))

  argument=$1

  echo "Argument: $argument"
  echo "Output File: $output_file"
  echo "Input File: $input_file"
}
