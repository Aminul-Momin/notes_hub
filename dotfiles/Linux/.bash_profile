
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



# User specific aliases and functions
complete -cf sudo

# Flask Environment Variables
# export FLASK_APP=run.py
# export FLASK_DEBUG=1
# export FLASK_ENV=dev
# export EMAIL_USER='amominnj@gmail.com'
# export EMAIL_PASS='recal'

export NTS="$HOME/NTS"