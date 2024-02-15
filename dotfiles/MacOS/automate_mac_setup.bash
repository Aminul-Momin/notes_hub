###############################################################################
###########################  DOTFILE CONFIGURATION ############################

mac_download_dotfiles(){
    : "
    NOTES: Download secrets.bash file manually since it's not in Github.
    "

    dot_files="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/macos"
    for file in .{bash_utils.bash,tmux.conf,aliases,bashrc,bash_profile,git-completion.bash,git-prompt.sh,git-aliases.bash}; do
        if [ ! -f $HOME/$file ]; then
            touch $HOME/$file
        fi
        curl $dot_files/$file > $HOME/$file

        if [ ! -f $HOME/init.vim ]; then
            touch $HOME/init.vim
        fi
        curl $dot_files/init.vim > $HOME/init.vim
    done
}

establish_dotfiles_symlink(){
    host_name=$(hostname)

    local mos01=(bash_utils.bash tmux.conf aliases)

    if [ $host_name = "MOS01" ]; then
        ln -sf $NTHUB/dotfiles/macos/bash_profile_mos01 $HOME/.bash_profile
        ln -sf $NTHUB/dotfiles/macos/config $HOME/.ssh/config

        for element in "${mos01[@]}"; do
            echo Linking "$element" ...
            ln -sf $NTHUB/dotfiles/macos/config $HOME/.$element
        done
    else
        ln -sf $NTHUB/dotfiles/macos/bash_profile_mos02 $HOME/.bash_profile
    fi

    ln -sf $NTHUB/dotfiles/macos/bashrc $HOME/.bashrc
    ln -sf $NTHUB/dotfiles/macos/git-aliases.bash $HOME/.git-aliases.bash
    ln -sf $NTHUB/dotfiles/macos/git-completion.bash $HOME/.git-completion.bash
    ln -sf $NTHUB/dotfiles/macos/git-prompt.sh $HOME/.git-prompt.sh
}


###############################################################################
###########################   VISUAL STUDIO CODE ##############################

mac_install_vscode(){
    brew install --cask visual-studio-code
}

mac_setup_vscode(){

    : '
    Downloads VSCode extensions into the directory, `~/.vscode/extensions`.
    Args:
        file_name: The file name containg vscode extention-ids seperated by new line.
    '

    dot_files="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles"
    
    if [! -f $HOME/Library/Application\ Support/Code/User/settings.json]; then
        echo "'~/Library/Application Support/Code/User/settings.json' is not found"
    else
        if [! -d $HOME/tmp]; then
            echo "Creating '$HOME/tmp' Directory"
            mkdir $HOME/tmp
        fi
        
        curl $dot_files/vscode/settings.json > $HOME/tmp
        curl $dot_files/vscode/vscode_extension_list.txt > $HOME/tmp
        ln -sf $HOME/tmp/settings.json ~/Library/Application\ Support/Code/User/settings.json

    fi

    while read line; do
        echo "Installing $line . . . . . "
        code --install-extension $line
        # printf "%$(tput cols)s\n"|tr " " "="
    done < $HOME/tmp/vscode_extension_list.txt

    if [! -f $HOME/.local/state/crossnote/style.less]; then
        echo "'$HOME/.local/state/crossnote/style.less' file is not fount"
    else
        curl $dot_files/vscode/style.less > $HOME/tmp
        ln -sf $HOME/tmp/style.less $HOME/.local/state/crossnote/style.less
    fi
}


# To uninstall VSCode extentions
uninstall_vscode_extensions(){
    : ' Uninstall VSCode extensions.
    Args:
        file_name: The file name containg vscode extention-ids seperated by new line.
    '

    while read line; do
        echo "Uninstalling $line . . . . . "
        code --uninstall-extension $line
        printf "%$(tput cols)s\n"|tr " " "="
    done < $1
}

###############################################################################
###########################    VIM CONFIGURATIONS   ###########################



mac_nvim_tmux_config_depricated(){
    : ' Configure nvim for your local MAC OS.
        NOTE: It removes 'vim' (.vimrc) configuration if there is any.
    '

    if [ -h ~/.vimrc] || [ -d ~/.vim]; then # (`-h` indicates ` ~/.vimrc` exist and it's symbolic link)
        rm -fr ~/.vimrc ~/.vim ~/.viminfo
    fi

    # Install `vim-plug` package manager to be used with nvim (`init.vim`). Check the documentation to use it with vim (`.vimrc`)
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    if [! -d ~/.config/nvim]; then
        mkdir -p ~/.config/nvim
    fi
    ln -fs $NTHUB/dotfiles/macos/init.vim ~/.config/nvim/init.vim
    
    # Install all plugins mentioned on `~/.config/nvim/init.vim` file
    nvim +PlugInstall +qall

    ## Build COC (Conquer of Completion) as follows:
    cd .local/share/nvim/pluged/coc.nvim && yarn install && yarn build

    ## Symlink to the tmux configuration file
    ln -fs $NTHUB/dotfiles/macos/tmux.conf ~/.tmux.conf
}

config_nvchad(){
    # Install NVChad (https://nvchad.com/docs/quickstart/install)
}

mac_vim_tmux_config(){
    : ' Configure nvim for your mac.
        NOTE: It removes 'vim' (.vimrc) configuration if there is any.
    '

    # (`-h` indicates `~/.config/nvim/init.vim` exist and it's symbolic link)
    if [ -h ~/.config/nvim/init.vim] || [ -d ~/.local/share/nvim]; then
        rm -fr ~/.config/nvim .local/share/nvim ~/.viminfo
    fi

    ln -fs $NTHUB/dotfiles/macos/vimrc ~/.vimrc

    # Install `vim-plug` package manager to be used with vim (`.vimrc`). Check the documentation to use it with neovim (`init.vim`)
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   
    # Install all plugins mentioned on `~/.vimrc` file
    vim +PlugInstall +qall

    ## Symlink to the tmux configuration file
    ln -fs $NTHUB/dotfiles/macos/tmux.conf ~/.tmux.conf
}


###############################################################################
#################################    MYSQL   ##################################

mac_install_mysql(){
    :'Installation of mysql'
    brew install mysql
}

mac_uninstall_mysql(){
    :'Unistallation of mysql'

    ps -ax | grep mysql  # stop and kill any MySQL processes
    sudo rm /usr/local/mysql
    sudo rm -rf /usr/local/var/mysql
    sudo rm -rf /usr/local/mysql*
    sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    sudo rm -rf /Library/StartupItems/MySQLCOM
    sudo rm -rf /Library/PreferencePanes/My*
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    # edit /etc/hostconfig and remove the line MYSQLCOM=-YES-
    rm -rf ~/Library/PreferencePanes/My*
    sudo rm -rf /Library/Receipts/mysql*
    sudo rm -rf /Library/Receipts/MySQL*
    sudo rm -rf /private/var/db/receipts/*mysql*
    sudo rm -rf /tmp/mysql*
    # # try to run mysql, it shouldn't work
}


###############################################################################
###############################     ANOCONDA    ###############################
mac_install_conda(){
    brew install --cask anaconda
    export PATH="/usr/local/anaconda3/bin:$PATH"
}
    