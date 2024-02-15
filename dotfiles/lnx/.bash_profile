export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,git-completion.bash,git-prompt.sh,git-aliases.bash,pbp.bash,secrets.bash}; do
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
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# =============================================================================
beautify_prompt(){
    # colors:
    green="\[\033[0;32m\]"
    blue="\[\033[0;34m\]"
    purple="\[\033[0;35m\]"
    reset="\[\033[0m\]"
    BRed='\033[1;31m'       # Bold Red
    Yellow='\033[0;33m' # Yellow
    Orange='\033[38;5;214m'
    BOrange='\e[1;33m'


    host=$(hostname)
    if [ $host = "MOS01" ]; then
        host_color=$BRed
    elif [ $host = "MOS02" ]; then
        host_color=$Orange
    else
        host_color=$green
    fi
    arrow_color=$purple

    # Prompt String
    export PS1="$host_color\u@${host}$arrow_color =>|$green\$(__git_ps1)$blue\W$arrow_color|\n$ $reset"
    # export PS1="$purple\u =>> |$green\$(__git_ps1)$blue\W$purple|\n$ $reset"

    # Meaning of
        #	\h     ->> the host name
        #	\n     ->> the new line
        #	\s     ->> the name of the shell
        #	\t     ->> the current time in 24-hour format
        #	\u     ->> the user name of current user
        #	\w     ->> the current working directory
        #	\W     ->> the basename of the current working directory
}
beautify_prompt

create_alias(){
    alias python=python3
    alias pip=pip3
    # alias vim=nvim
    # alias tmux="tmux 2"
}


# User specific aliases and functions
complete -cf sudo


if [ ! -f $HOME/rough.md ]; then
    touch $HOME/rough.md;
fi
alias rgh="code $HOME/rough.md"
