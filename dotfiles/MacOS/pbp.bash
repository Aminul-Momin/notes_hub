############################# Personal bash_profile ############################


# append mysql binary into the `PATH`` variable.
# export PATH=${PATH}:/usr/local/mysql/bin

# append PostgresQL into the `PATH`` variable.
# export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/13/bin

# Add `GNU grep` to the path so that it can be used instead of the Apple version (BSD grep).
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=$JAVA_HOME/bin:$PATH

# Added Drivers for Automation Testing
export PATH="$GD/gd/Software_Development/Web_Development/qa_automation/robot_framework/chromedriver:$PATH"
export PATH="$GD/gd/Software_Development/Web_Development/qa_automation/robot_framework/geckodriver:$PATH"

# export M2_HOME='/Applications/apache-maven-3.8.1'
# export PATH=$PATH:$M2_HOME/bin


export ADS="$GD/gd/Software_Development/Algorithms_and_Data_Structures/"
export SD="$GD/gd/Software_Development"
export GDT="$GD/gd/Desktop"
export ML="$GD/gd/Software_Development/Machine_Learning/"
export JOBS_DB="$GD/gd/Jobs_DB"
export NLTK_DATA='$GD/nltk_data'
export UTILS="$GD/gd/Software_Development/notes_hub/utils"

# Flask Environment Variables
export FLASK_APP=run.py
export FLASK_DEBUG=1
export FLASK_ENV=dev
export EMAIL_USER='amominnj@gmail.com'
export EMAIL_PASS='recall'

export NTHUB="$GD/gd/Software_Development/notes_hub"


# eval "$(pyenv virtualenv-init -)"

# set horizontal-scroll-mode on # to disable word wrap in terminal; not Working !!