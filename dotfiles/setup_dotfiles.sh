
# for_mac_only(){

# }

# for_lnx_only(){

# }

# for_gitbash_only(){
    
# }

bash_dotfiles_lnx(){
    nt_dotfiles="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux"
    curl $nt_dotfiles/.bashrc > ~/.bashrc
    curl $nt_dotfiles/.bash_profile > ~/.bash_profile
    curl $nt_dotfiles/.aliases > ~/.aliases
    curl $nt_dotfiles/.git-completion.bash > ~/.git-completion.bash
    curl $nt_dotfiles/.git-prompt.sh > ~/.git-prompt.sh
    curl $nt_dotfiles/.git-aliases.bash > ~/.git-aliases.bash
}

vim_dotfiles_lnx(){
    # my_home=/home/$USER
    # vimrc_file="$my_home/.vimrc"
    # if [ -e $vimrc_file ]; then      # Check if file exists.
    #     mkdir $my_home/old_vimrc
    #     mv $vimrc_file $my_home/old_vimrc/
    # fi
    
    # for dir in $my_home/.{local/share/nvim config/nvim}; do
    #     if [ -d $dir ]; then
    #         if [! -d $my_home/old_nvim]; then
    #             mkdir $my_home/old_nvim
    #         fi

    #         if [! -f $my_home/old_nvim/README.md]; then
    #             touch $my_home/old_nvim/README.md
    #         fi

    #         cat $dir >> $my_home/old_nvim/README.md
    #         mv $dir $my_home/old_nvim/
    #     fi
    # done;

    src_vimrc="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux"
    
    # download my `.vimrc` from my github account.
    curl $src_vimrc/.vimrc > ~/.vimrc

    # Install `vim-plug` package manager to be used with vim (`.vimrc`). Check the documentation to use it with neovim (`init.vim`)
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # inorder to install vim plugins:
        # `$ vim ~/.vimrc`
        # `:PlugInstall`
}

nvim_dotfiles_lnx(){
    # Install `vim-plug` package manager to be used with nvim (`init.vim`). Check the documentation to use it with vim (`.vimrc`)
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    
    ## Build COC as follows:
    # cd .local/share/nvim/pluged/coc.nvim
    # yarn install
    # yarn build

    ## configuration: ~/.config/nvim/
}

notes_cmds(){

    nt_cmds="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/cmds"
    for file in notes_{airflow,docker,git,py,vim}.md; do
        if [! -d $HOME/NTS]; then
            mkdir $HOME/NTS
        fi
        curl $nt_cmds/$file >> $HOME/NTS/$file
    done
}

# To install VSCode extentions
install_vscode_extensions(){
    
    :' Downloads VSCode extensions into the directory, `~/.vscode/extensions`.
    Args:
        file_name: The file name containg vscode extention-ids seperated by new line.
    '

    while read line; do
        echo "Installing $line . . . . . "
        code --install-extension $line
        # printf "%$(tput cols)s\n"|tr " " "="
    done < $1
}

# To uninstall VSCode extentions
uninstall_vscode_extensions(){
    :' Uninstall VSCode extensions.
    Args:
        file_name: The file name containg vscode extention-ids seperated by new line.
    '

    while read line; do
        echo "Uninstalling $line . . . . . "
        code --uninstall-extension $line
        printf "%$(tput cols)s\n"|tr " " "="
    done < $1
}

ln_bash_dotfiles(){
    for dot_file in $NTS/dotfiles/MacOS/.{aliases,bash_profile,bashrc,git-*}; do
        if [! -d $1]; then
            ln -fsv $dot_file $HOME
        else
            mkdir $HOME/DUMMY_HM
            ln -fsv $dot_file $HOME/DUMMY_HM
        fi
    done
}


download_vim_config_files(){
    cd ~
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/vim_configs/vim01_python/.vimrc >> ~/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # then Open `~/.vimrc` file with vim.
}

mac_curl_dotfiles(){

    dot_files="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/MacOS"
    for file in .{bashrc,bash_profile,aliases,git-completion.bash,git-prompt.sh,git-aliases.bash,pbp.bash,tmux.conf}; do
        if [! -f $HOME/$file]; then
            touch $HOME/$file
        fi
        curl $dot_files/$file > $HOME/$file

        if [! -f $HOME/init.vim]; then
            touch $HOME/init.vim
        fi
        curl $dot_files/init.vim > $HOME/init.vim
    done
}

mac_symlink_dotfiles(){
    # dir="$GD/gd/Software_Development/notes_hub/dotfiles/MacOS"
    # for dot_file in {bash_profile,bashrc,secrets.bash,pbp.bash,aliases,git-aliases.bash,git-completion.bash,git-prompt.sh,tmux.conf}; do
    #     echo $dir/$dot_file
    #     echo .$dot_file
    #     if [! -f $HOME/.$dot_file]; then
    #         touch $HOME/.$dot_file
    #     fi
    #     ln -fs $dir/$dot_file ~/.$dot_file
    # done
    # ln -fs $dir/init.vim init.vim

    ln -sf $NTHUB/dotfiles/MacOS/bash_profile $HOME/.bash_profile
    ln -sf $NTHUB/dotfiles/MacOS/bashrc $HOME/.bashrc
    ln -sf $NTHUB/dotfiles/MacOS/aliases $HOME/.aliases
    ln -sf $NTHUB/dotfiles/MacOS/git-aliases.bash $HOME/.git-aliases.bash
    ln -sf $NTHUB/dotfiles/MacOS/git-completion.bash $HOME/.git-completion.bash
    ln -sf $NTHUB/dotfiles/MacOS/git-prompt.sh $HOME/.git-prompt.sh
    ln -sf $NTHUB/dotfiles/MacOS/secrets.bash $HOME/.secrets.bash
    ln -sf $NTHUB/dotfiles/MacOS/init.vim $HOME/init.vim
    ln -sf $NTHUB/dotfiles/MacOS/settings.json /Users/am/Library/Application\ Support/Code/User/settings.json
}    