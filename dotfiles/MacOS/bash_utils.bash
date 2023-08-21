

# Add `GNU grep` to the path so that it can be used instead of the Apple version (BSD grep).
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Set `VSCode` as Crontab's editor.
# export VISUAL=code

# Added Web Drivers for Automation Testing
export PATH="$HOME/mydocs/Software_Development/Web_Development/qa_automation/robot_framework/chromedriver:$PATH"
export PATH="$HOME/mydocs/Software_Development/Web_Development/qa_automation/robot_framework/geckodriver:$PATH"


export ADS="$HOME/mydocs/Software_Development/Algorithms_and_Data_Structures"
export SD="$HOME/mydocs/Software_Development"
export GD="$HOME/mydocs/gd"
export ML="$HOME/mydocs/Software_Development/Machine_Learning"
export NLTK_DATA='$HOME/nltk_data'
export UTILS="$HOME/mydocs/Software_Development/notes_hub/utils"

# Flask Environment Variables
export FLASK_APP=run.py
export FLASK_DEBUG=1
export FLASK_ENV=dev
export EMAIL_USER='amominnj@gmail.com'
export EMAIL_PASS='recall'



# eval "$(pyenv virtualenv-init -)"


create_alias(){
    alias python=python3
    alias pip=pip3
    # alias vim=nvim
    # alias tmux="tmux 2"
}
create_alias

establish_links(){
    ln -sf $NTHUB/nts/notes_cicd.md \
        /Users/am/mydocs/Software_Development/Web_Development/cicd/notes_cicd.md
    ln -sf $NTHUB/nts/notes_django.md \
        /Users/am/mydocs/Software_Development/Web_Development/django-courses/notes_django.md
    ln -sf $NTHUB/nts/notes_aws.md \
        /Users/am/mydocs/Software_Development/Web_Development/aws/notes_aws.md
    ln -sf $NTHUB/nts/notes_docker.md \
        /Users/am/mydocs/Software_Development/Web_Development/dockers/notes_docker.md
}
establish_links

if [ ! -f $HOME/rghnts.md ]; then
    touch $HOME/rghnts.md;
fi
alias rghnts="code $HOME/rghnts.md"


tmxnew(){
    if [[ -n $1 ]]; then tmux new -s $1 
    else tmux new -s main
    fi
}

tmxkill(){
    if [[ -n $1 ]]; then tmux kill-ses -t $1 
    else tmux kill-ses -t main
    fi
}

# # Function to rsync the document folder to a flash drive based on the target value
function sync_to_volume() {
    # local target="$1"
    rsync -avz \
        --exclude '.venv' \
        --exclude 'venv*' \
        --exclude 'node_modules' \
        --exclude '.ipynb_checkpoints' \
        --exclude '.egg-info' \
        --exclude '*.egg-info' \
        --exclude '*.class' \
        --exclude '*.DS_Store' \
        --exclude '.pytest_cache' \
        --exclude '__pycache__' $HOME/mydocs/ /Volumes/$1/MYDOCS_BACKUP/

    # case "$target" in
    #     "mypassport")
    #         echo "Syncing $HOME/mydocs/ to /Volumes/mypassport/MYDOCS_BACKUP/"
    #         rsync -avz --exclude '.venv' --exclude 'venv*' --exclude 'node_modules' --exclude '.ipynb_checkpoints' --exclude '.egg-info' --exclude '*.egg-info' --exclude '*.class' --exclude '*.DS_Store' --exclude '.pytest_cache' --exclude '__pycache__' $HOME/mydocs/ /Volumes/mypassport/MYDOCS_BACKUP/
    #         ;;
    #     "FD01")
    #         echo "Syncing $HOME/mydocs/ to /Volumes/Momin-MC01/MYDOCS_BACKUP/"
    #         rsync -avz --exclude '.venv' --exclude 'venv*' --exclude 'node_modules' --exclude '.ipynb_checkpoints' --exclude '.egg-info' --exclude '*.egg-info' --exclude '*.class' --exclude '*.DS_Store' --exclude '.pytest_cache' --exclude '__pycache__' $HOME/mydocs/ /Volumes/Momin-MC01/MYDOCS_BACKUP/
    #         ;;
    #     *)
    #         echo "Invalid target. Please choose one of: mypassport, mc01, target3."
    #         ;;
    # esac
}


remove_pattern(){
    find $1 -type d -name "__pycache__*" -exec rm -rf {} \;
    find $1 -type f -name "*.class" -delete
}

launch_ec2(){
    : ' Given the AWS EC2 inastance Name, it will launch the instance. Its assumed that the given instance is already created.
    Args:
        ($1): AWS EC2 inastance Name (Host) in your `~/.ssh/config` file.
    '
    local INSTANCE_NAME=$1

    case "$INSTANCE_NAME" in
        "rhel")
            local INSTANCE_ID="${AWS_RHEL_INSTANCE_ID}"
            echo "Your $INSTANCE_NAME (Instance ID: $INSTANCE_ID) is starting ..."
            ;;
        "ubuntu_server")
            local INSTANCE_ID="${AWS_UBUNTU_SERVER_INSTANCE_ID}"
            echo "Your $INSTANCE_NAME (Instance ID: $INSTANCE_ID) is starting ..."
            ;;
        *)
            echo "Invalid Server Name: $1. Please choose one of: 'rhel', 'ubuntu_server'."
            return 1
            ;;
    esac

    # Start the EC2 instance
    aws ec2 start-instances --instance-ids "$INSTANCE_ID"
    sleep 30

    local matching="Host $INSTANCE_NAME"
    local public_ip=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[].Instances[].PublicIpAddress' --output text)
    local replacement="HostName $public_ip"


    if [ $public_ip ]; then
        echo "Your $INSTANCE_NAME is Started (public IP address: $public_ip)"

        mkdir ~/temp
        cp ~/.ssh/config ~/temp/config.bak
        
        # This will find the line containing "Host ubuntu_server", skip to the next line using n, and then delete that line using d.
        sed "/$matching/{n; d;}" ~/.ssh/config > ~/temp/config
        # sed -i .bak "/Host ubuntu_server/a $replacement" ~/.ssh/config # On Linux
        sed -e "/$matching/a\\"$'\n'"$replacement" ~/temp/config > ~/.ssh/config # on mac Only
        
        mv ~/temp/config.bak ~/.ssh/
        rm -fr ~/temp
    fi
}

stop_ec2(){
    : ' Given the AWS EC2 inastance Name, it will stop the running instance.
    Args:
        ($1): AWS EC2 inastance Name (Host) in your `~/.ssh/config` file
    '
    local INSTANCE_NAME=$1

    case "$INSTANCE_NAME" in
        "rhel")
            local INSTANCE_ID="${AWS_RHEL_INSTANCE_ID}"
            echo "Your $INSTANCE_NAME (Instance ID: $INSTANCE_ID) is stopping ..."
            ;;
        "ubuntu_server")
            local INSTANCE_ID="${AWS_UBUNTU_SERVER_INSTANCE_ID}"
            echo "Your $INSTANCE_NAME (Instance ID: $INSTANCE_ID) is stopping ..."
            ;;
        *)
            echo "Invalid Server Name: $1. Please choose one of: 'rhel', 'ubuntu_server'."
            return 1
            ;;
    esac

    # Start the EC2 instance
    aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
}
