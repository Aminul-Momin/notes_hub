
bash_dotfiles_lnx(){
    nt_hub="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux"
    curl $nt_hub/.bashrc > ~/.bashrc
    curl $nt_hub/.bash_profile > ~/.bash_profile
    curl $nt_hub/.aliases > ~/.aliases
    curl $nt_hub/.git-completion.bash > ~/.git-completion.bash
    curl $nt_hub/.git-prompt.sh > ~/.git-prompt.sh
    curl $nt_hub/.git-aliases.bash > ~/.git-aliases.bash
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
}