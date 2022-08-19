# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;




## -------------- From udacity.com on August 2, 2017 -------------- ##
# The following line of code is appended here to learn the Git & Github  from

# Udacity.com to Enable tab completion
source ~/.git-completion.bash

# colors:
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt :
source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1

# Prompt String
export PS1="$purple\u -->>|$green\$(__git_ps1)$blue\W$purple|\n$ $reset"

# Meaning of
	#	\h     ->> the host name
	#	\n     ->> the new line
	#	\s     ->> the name of the shell
	#	\t     ->> the current time in 24-hour format
	#	\u     ->> the user name of current user
	#	\w     ->> the current working directory
	#	\W     ->> the basename of the current working directory

## ------------------------ End of Udacity Block ------------------------ ##



###############################################################################
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

###############################################################################
################################# Google Cloud SDK ############################


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/path.bash.inc' ]; then . '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/a.momin/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc'; fi



######################### MY SPECIAL SHELL VARIABLES ##########################


export PATH=${PATH}:/usr/local/mysql/bin        # -> append mysql binary into path variable.

# PATH="/Library/Folder1/Folder2:${PATH}"
	# ->> add '/Library/Folder1/Folder2' in front of Existing path
	# here ':' is path separator
	# ${PATH} ->> Existing Path.


# Add Python3.9 executable to the PATH.
PATH="/usr/local/Cellar/python@3.9/3.9.13_1/Frameworks/Python.framework/Versions/3.9/bin/python3.9:${PATH}"
export PATH
# Add Python3.7 executable to the PATH.
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

# Add `GNU grep` to the path so that it can be used instead of the Apple version (BSD grep).
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Add PostgresQL to the PATH variable.
export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/13/bin

alias python=python3
alias pip=pip3

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# export PATH='/usr/local/Cellar/python3/3.7.3/bin':${PATH}
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
export EMAIL_PASS='recal'

source /Users/a.momin/gd/Software_Development/Machine_Learning/notes_hub/customize_workspaces/workspace_funcs.sh