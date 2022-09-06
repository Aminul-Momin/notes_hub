
bash_dotfiles_lnx(){
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux/.bashrc > ~/.bashrc
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux/.bash_profile > ~/.bash_profile
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux/.aliases > ~/.aliases
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux/.git-completion.bash > ~/.git-completion.bash
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux/.git-prompt.sh > ~/.git-prompt.sh
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux/.git-aliases.bash > ~/.git-aliases.bash
}

vim_dotfiles_lnx(){
    # Remove existing neovim configuration
    # rm -fr ~/.local && rm -fr ~/.config/nvim

    my_home=/home/$USER
    vimrc_file="$my/.vimrc"
    if [ -e $vimrc_file ]; then      # Check if file exists.
        mkdir $my_home/old_vimrc
        mv $vimrc_file $my_home/old_vimrc/
    fi
    
    for dir in $my_home/.{local config/nvim}; do
        if [ -d $dir ]; then
            if [! -d $my_home/old_nvim]; then
                mkdir $my_home/old_nvim
            fi

            mv -r $dir $my_home/old_nvim/
        fi
    done;

    # download my `.vimrc` from my github account.
    curl https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/Linux/.vimrc > ~/.vimrc

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