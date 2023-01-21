############################# Personal bash_profile ############################

################################# Anaconda Setup ##############################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/a.momin/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/a.momin/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/a.momin/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/a.momin/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

################################# Google Cloud SDK ############################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/path.bash.inc' ]; then . '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc'; fi



######################### MY SPECIAL SHELL VARIABLES ##########################

# append mysql binary into the `PATH`` variable.
export PATH=${PATH}:/usr/local/mysql/bin

# append PostgresQL into the `PATH`` variable.
export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/13/bin

# Add `GNU grep` to the path so that it can be used instead of the Apple version (BSD grep).
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# Added Drivers for Automation Testing
export PATH="/Users/a.momin/gd/Software_Development/Web_Development/qa_automation/robot_framework/chromedriver:$PATH"
export PATH="/Users/a.momin/gd/Software_Development/Web_Development/qa_automation/robot_framework/geckodriver:$PATH"

export M2_HOME='/Applications/apache-maven-3.8.1'
export PATH=$PATH:$M2_HOME/bin

export GIT_TOKEN='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'

export ADS='/Users/a.momin/gd/Software_Development/Python_Program/Python3/Algorithms_and_Data_Structures/'
export SD='/Users/a.momin/gd/Software_Development'
export GDT='/Users/a.momin/gd/Desktop'
export DS='/Users/a.momin/gd/Software_Development/Machine_Learning/notes_hub'
export JOBS_DB='/Users/a.momin/gd/Jobs_DB'
export NLTK_DATA='/Users/a.momin/nltk_data'
export UTILS='/Users/a.momin/gd/Software_Development/Machine_Learning/notes_hub/utils'

# Flask Environment Variables
export FLASK_APP=run.py
export FLASK_DEBUG=1
export FLASK_ENV=dev
export EMAIL_USER='amominnj@gmail.com'
export EMAIL_PASS='..5.....4'

# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
eval "$(pyenv virtualenv-init -)"

set horizontal-scroll-mode on # to disable word wrap in terminal; not Working !!