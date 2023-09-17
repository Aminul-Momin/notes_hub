lnx_load_dotfiles(){
    : ' Install short version 'notes_hub' into home directory
        NOTE:
    '
    mkdir -p $HOME/notes_hub/dotfiles/lnx
    export NTHUB="$HOME/notes_hub"
    dotfiles="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/lnx"
    files=(bashrc bash_profile aliases git-completion.bash git-prompt.sh git-aliases.bash)
    for file in "${files[@]}"; do
        if [! -f $NTHUB/dotfiles/lnx/$file ]; then
            touch $NTHUB/dotfiles/lnx/$file
        fi
        curl $dotfiles/.$file > $NTHUB/dotfiles/lnx/$file
        # echo $file
    done
    # curl $nt_dotfiles/bash_profile > $NTHUB/dotfiles/lnx/bash_profile
    # curl $nt_dotfiles/aliases > $NTHUB/dotfiles/lnx/aliases
    # curl $nt_dotfiles/git-completion.bash > $NTHUB/dotfiles/lnx/git-completion.bash
    # curl $nt_dotfiles/git-prompt.sh > $NTHUB/dotfiles/lnx/git-prompt.sh
    # curl $nt_dotfiles/git-aliases.bash > $NTHUB/dotfiles/lnx/git-aliases.bash
}

lnx_vim_dotfiles(){
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

lnx_nvim_dotfiles(){
    # Install `vim-plug` package manager to be used with nvim (`init.vim`). Check the documentation to use it with vim (`.vimrc`)
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    
    ## Build COC as follows:
    # cd .local/share/nvim/pluged/coc.nvim
    # yarn install
    # yarn build

    ## configuration: ~/.config/nvim/
}


download_vim_config_files(){
    cd ~
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/vim_configs/vim01_python/.vimrc >> ~/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # then Open `~/.vimrc` file with vim.
}


lnx_notes_cmds(){

    nt_cmds="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/cmds"
    for file in notes_{airflow,docker,git,py,vim}.md; do
        if [! -d $HOME/NTS]; then
            mkdir $HOME/NTS
        fi
        curl $nt_cmds/$file >> $HOME/NTS/$file
    done
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

mac_curl_dotfiles(){

    dot_files="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/macos"
    for file in .{bashrc,bash_profile,aliases,git-completion.bash,git-prompt.sh,git-aliases.bash,bash_utils.bash,tmux.conf}; do
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

mac_symlink_dotfiles(){
    host_name=$(hostname)

    if [ $host_name = "MOS01" ]; then
        ln -sf $NTHUB/dotfiles/macos/bash_profile_mos01 $HOME/.bash_profile
    elif [ $host_name = "MOS02" ]; then
        ln -sf $NTHUB/dotfiles/macos/bash_profile_mos02 $HOME/.bash_profile
    else
        ln -sf $NTHUB/dotfiles/macos/bash_profile_mos01 $HOME/.bash_profile
    fi

    ln -sf $NTHUB/dotfiles/macos/bashrc $HOME/.bashrc
    ln -sf $NTHUB/dotfiles/macos/aliases $HOME/.aliases
    ln -sf $NTHUB/dotfiles/macos/pbp.bash $HOME/.pbp.bash
    ln -sf $NTHUB/dotfiles/macos/git-aliases.bash $HOME/.git-aliases.bash
    ln -sf $NTHUB/dotfiles/macos/git-completion.bash $HOME/.git-completion.bash
    ln -sf $NTHUB/dotfiles/macos/git-prompt.sh $HOME/.git-prompt.sh
    ln -sf $NTHUB/dotfiles/macos/secrets.bash $HOME/.secrets.bash
    ln -sf $NTHUB/dotfiles/macos/config $HOME/.ssh/config
}

mac_setup_vscode(){

    : '
    Downloads VSCode extensions into the directory, `~/.vscode/extensions`.
    Args:
        file_name: The file name containg vscode extention-ids seperated by new line.
    '
    # Install vscode
    brew install vscode

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

mac_nvim_tmux_config(){
    : ' Configure nvim for your mac.
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

    ## Build COC as follows:
    cd .local/share/nvim/pluged/coc.nvim && yarn install && yarn build

    ## Symlink to the tmux configuration file
    ln -fs $NTHUB/dotfiles/macos/tmux.conf ~/.tmux.conf
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

prepare_my_mac(){
    : ' Not done yet
        NOTE: rough !!
    '
    brew install mysql
    brew install tmux
    brew install postgresql
    brew install tmux

}