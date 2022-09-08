-   [[notes_vim]]

### Tutorials:

-   [NeuralNine/Awesome Neovim Setup From Scratch - Full Guide](https://www.youtube.com/watch?v=JWReY93Vl6g)
-   [Neovim from Scratch](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
    -   [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
-   [Neovim](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg)
-   [Vimscript](https://www.youtube.com/watch?v=px74GhBAG9I)
-   [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
-   [Vim Configurations](https://www.youtube.com/watch?v=n9k9scbTuvQ&list=PLm323Lc7iSW9kRCuzB3J_h7vPjIDedplM&index=4):
-   [NeoVim Configuration](https://www.youtube.com/watch?v=DogKdiRx7ls&t=516s):

### Vim

-   [NeuralNine/Vim](https://www.youtube.com/playlist?list=PL7yh-TELLS1Eevqs4-XmlSfrFOKb5C97K)
    -   [GitHub/config](https://github.com/NeuralNine/config-files)
-   <font color=red size=5>`~/.vimrc`</font> $\rightarrow$ Configuration file

### neovim

-   Configuration File: `~/.config/nvim/init.vim`

**NOTES**

-   `:options` $→$ Seeking help on options
-   `:h tabstop` $→$ Seeking help on 'tabstop' option.
-   `:echo has('python3')`
-   `:checkhealth`

-   `let mapleader = "\<Space>"` $\rightarrow$ Set leader as Space
-   `let mapleader = " "` $\rightarrow$ Set leader as Space

#### How to use [vim-plug](https://github.com/junegunn/vim-plug):

-   <font color=red>Download the vim plugins manager called **vim-plug** from git hub. Then use following comands to manage your vim plugins.</font>

-   `:PlugInstall` $\rightarrow$ Install plugins
-   `$ vim +PlugInstall +qall`
    -   Install vim plugins from terminal.
-   `:PlugUpdate` $\rightarrow$ Update plugins：
-   `:PlugClean` $\rightarrow$ Remove plugins： (Before run this command, comment the plugin install command in init.vim)
-   `:PlugStatus` $\rightarrow$ Check the plugin status：
-   `:PlugUpgrade` $\rightarrow$ Upgrade vim-plug itself：

### [Technical Problems](https://superuser.com/questions/1115159/how-do-i-install-vim-on-osx-with-python-3-support):

#### Python Integration of Vim:

-   [A setup for python](https://github.com/Optixal/neovim-init.vim)
-   [Setup Neovim for Python](https://yufanlu.net/2018/09/03/neovim-python/)
-   [Python in Vim](https://jdhao.github.io/2019/04/22/mix_python_and_vim_script/):
-   [Vim as an Python IDE](https://medium.com/nerd-for-tech/vim-as-an-ide-for-python-2021-f922da6d2cfe)
