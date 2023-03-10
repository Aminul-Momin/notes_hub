-   ๐ณ๐๐๐ ๐๐ ๐๐ฌ๐๐๐ฎ๐ฅ๐ฅ ๐บ๐๐๐๐๐๐: โฎ โ โฌ๏ธ โ โฅ + โ + โคถ โง ๏ฃฟ โคถ โฌ โฉ๏ธ โฒ โต โซ โญฟ โฅ โ ๐พ & ๐ฅ

---

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">Vim Shortcutes</summary>

-   `<Space> n` โ Toggle folder/file explorer
-   `<Space> t` โ Toggle Tagbar
-   `<Space> m` โ Toggle mouse ON/OFF
-   `โ + w` + `โ/โ/โ/โฌ๏ธ` โ Shift focus across vim pane.
-   How to comment out multiple lines?
    -   mark lines needed to be commented
    -   `:/s/^/#` โ substitute starting of marked lines by `#`

---

### EXITING:

-   `:q! or ZQ` โ Quit and throw away unsaved changes
-   `:q` โ Quit (fails if there are unsaved changes)
-   `:w` โ Write (save) the file, but donโt exit
-   `:w !sudo tee %` โ Write out the current file using sudo
-   `:wq` / `:x` / `ZZ` โ Write (save) and quit
-   `:source %` โ source (`run`) the current file (lua files) you are working on.
-   i + gt (i in [1-9]) โ Focus i-th buffer (Vim Tab)
-   `<SPACE> + [` / `<SPACE> + ]` โ Changes the focus across the Buffer (Vim Tab)
-   Usage of: `f,t,w,b,%,h,j,k,l`
-   `v` โ to select range of text
    -   After selecting the text, try d to delete, or y to copy, or :s/match/replace/, or :center, or !sort, or...
-   ๐ฅ`โฌ๏ธ + v` โ to select a line.
-   `โ + v` โ to select columns of text
-   `yiw` โ copy the word where the curson on
-   `:m 12` โ move current line to after line 12
-   `:5,7m 21` โ move lines 5, 6 and 7 to after line 21
-   `:/pattern + โฎ` โ Highlight the pattern.
    -   `n` / `shift+n` โ to hop over the highlighted patterns.
-   `shift + *`/`shift + #` โ Search for the word currently cursor is in.Repeat to get the next/previous occurance
-   `x` โ to cut character.
-   `g;` โ to go through changes in backward
-   `g,` โ to go through changes in forword
-   `~` โ to switch cases
-   `:changes` โ to see all the changes
-   `:jumps`

---

๐ฅ Tip: Prefix a cursor movement command with a number to repeat it. For example, `4j` moves down 4 lines.

### ENTERING INTO INSERT MODE:

-   `๐ฅ i` โ Insert `before the focused character`.
-   `๐ฅ a` โ Insert (append) `after the focused character`.
-   `๐ฅ o` โ Append (open) a new line `below the current line`.
-   `๐ฅ I` โ Insert at the `beginning of the line`
-   `๐ฅ A` โ Insert (append) `at the end of the line`
-   `๐ฅ O` โ Append (open) a new line `above the current line`.
-   `ea` โ Insert (append) `at the end of the word`
-   `Esc` โ Exit insert mode

### CUT AND PASTE IN NORMAL MODE:

-   `yy` โ Yank (copy) a line
-   `2yy` โ Yank (copy) 2 lines
-   `yw` โ Yank (copy) the characters of the word from the cursor position to the start of the next word
-   `y$` โ Yank (copy) to end of line
-   `:%y+` โ Yank the whole file
-   `p` โ Put (paste) the clipboard after focused character.
-   `P` โ Put (paste) before focused character.
-   `dd` โ Delete (cut) a line
-   `2dd` โ Delete (cut) 2 lines
-   `dw` โ Delete (cut) the characters of the word from the cursor position to the start of the next word
-   `D` โ Delete (cut) to the end of the line
-   `d$` โ Delete (cut) to the end of the line
-   `x` โ Delete (cut) character

### EDITING IN NORMAL MODE:

-   `V` โ Sellect the line of which the cursor is on
-   `๐ฅ J` โ join line below to the current line
-   `๐ฅ u` โ undo
-   `๐ฅ Ctrl + r` โ redo
-   `๐ฅ .` โ repeat last command
-   `r` โ replace a single character
-   `cc` โ change (replace) entire line
-   `cw` โ change (replace) to the end of the word
-   `c$` โ Change (replace) to the end of the line
-   `s` โ Delete character and substitute text
-   `S` โ Delete line and substitute text (same as cc)
-   `๐ฅ xp` โ Transpose two letters (delete and paste)

### CURSOR MOVEMENTS:

-   `h`/`j`/`k`/`l` โ Move cursor Left/Down/Up/Right
-   `H`/`M`/`L` โ Move to Top/Middle/Bottom of screen
-   `๐ฅ w` โ Jump forwards to the start of a word
-   `W` โ Jump forwards to the start of a word (words can contain punctuation)
-   `๐ฅ e` โ Jump forwards to the end of a word
-   `E` โ Jump forwards to the end of a word (words can contain punctuation)
-   `b` โ Jump backwards to the start of a word
-   `B` โ Jump backwards to the start of a word (words can contain punctuation)
-   `0` โ Jump to the start of the line
-   `๐ฅ ^` โ Jump to the first non-blank character of the line
-   `๐ฅ $` โ Jump to the end of the line
-   `๐ฅ g_` โ Jump to the last non-blank character of the line
-   `๐ฅ gg` โ Go to the first line of the document
-   `๐ฅ G` โ Go to the last line of the document
-   `๐ฅ 5G` โ Go to line 5
-   `๐ฅ fx` โ Jump to next occurrence of character x
-   `๐ฅ tx` โ Jump to before next occurrence of character x
-   `}` โ Jump to next paragraph (or function/block, when editing code)
-   `{` โ Jump to previous paragraph (or function/block, when editing code)
-   `zz` โ Center cursor on screen
-   `Ctrl + b` โ Move back one full screen
-   `Ctrl + f` โ Move forward one full screen
-   `๐ฅ Ctrl + d` โ Move forward 1/2 a screen
-   `๐ฅ Ctrl + u` โ Move back 1/2 a screen

### VISUAL COMMANDS:

-   `>` โ Shift text right
-   `<` โ Shift text left
-   `y` โ Yank (copy) marked text
-   `d` โ Delete marked text
-   `๐ฅ ~` โ Switch case

### SEARCH AND REPLACE:

-   `๐ฅ /pattern` โ Search for pattern
-   `๐ฅ ?pattern` โ Search backward for pattern
-   `\vpattern` โ โVery magicโ pattern: non-alphanumeric characters are interpreted as special regex symbols (no escaping needed)
-   `n` โ Repeat search in same direction
-   `N` โ Repeat search in opposite direction
-   `:/pattern + โฎ` โ Highlight the pattern.
    -   `n` / `shift+n` โ to hop over the highlighted patterns.
-   `shift + *`/`shift + #` โ Search for the word currently cursor is in.Repeat to get the next/previous occurance
-   `๐ฅ :%s/old/new/g` โ Replace all old with new throughout file
-   `๐ฅ :%s/old/new/gc` โ Replace all 'old' with 'new' throughout file with confirmations
-   `:noh` โ Highlighting of search matches

### SEARCH IN MULTIPLE FILES:

-   `:vim[grep] /pattern/ {`{file}`}`
-   `:vimgrep /pattern/ {file}` โ Search for pattern in multiple files (EX: `:vimgrep /foo/ **/*`)
-   `:cn` โ Jump to the next match
-   `:cp` โ Jump to the previous match
-   `:copen` โ Open a window containing the list of matches

### WORKING WITH MULTIPLE FILES:

-   `:e file` โ Edit a file in a new buffer
-   `:bnext or :bn` โ Go to the next buffer
-   `:bprev or :bp` โ Go to the previous buffer
-   `:bd` โ Delete a buffer (close a file)
-   `:ls` โ List all open buffers
-   `:sp file` โ Open a file in a new buffer and split window
-   `:vsp file` โ Open a file in a new buffer and vertically split window
-   `Ctrl + ws` โ Split window
-   `Ctrl + ww` โ Switch windows
-   `Ctrl + wq` โ Quit a window
-   `Ctrl + wv` โ Split window vertically
-   `Ctrl + wh` โ Move cursor to the left window (vertical split)
-   `Ctrl + wl` โ Move cursor to the right window (vertical split)
-   `Ctrl + wj` โ Move cursor to the window below (horizontal split)
-   `Ctrl + wk` โ Move cursor to the window above (horizontal split)

### TABS:

-   `๐ฅ :tabnew or :tabnew file`
    -   open a file in a new tab
-   `Ctrl + wT`
    -   move the current split window into its own tab
-   `๐ฅ gt or :tabnext or :`tabn
    -   move to the next tab
-   `๐ฅ gT or :tabprev or :tabp`
    -   move to the previous tab
-   `๐ฅ #gt`
    -   move to tab number #
-   `:tabmove #`
    -   move current tab to the #th position (indexed from 0)
-   `๐ฅ :tabclose or :tabc`
    -   close the current tab and all its windows
-   `:tabonly or :tabo`
    -   close all tabs except for the current one
-   `:tabdo command`
    -   run the command on all tabs (e.g. :tabdo q
    -   closes all opened tabs)

### MARKING TEXT (VISUAL MODE):

-   `v` โ Start visual mode, mark lines, then perform an operation (such as d-delete)
-   `V` โ Start linewise visual mode
-   `Ctrl + v` โ Start blockwise visual mode
-   `o` โ Move to the other end of marked area
-   `O` โ Move to other corner of block
-   `aw` โ Mark a word
-   `ab` โ A block with ()
-   `aB` โ A block with {}
-   `ib` โ Inner block with ()
-   `iB` โ Inner block with {}
-   `Esc` โ Exit visual mode

### GLOBAL:

-   `:help keyword` โ Open help for keyword
-   `:o file` โ Open file
-   `:saveas file` โ Save file as
-   `:close` โ Close current window

### REGISTERS:

-   `:reg` โ Show registers content
-   `"xy` โ Yank into register x
-   `"xp` โ Paste contents of register x

-   Tip: Registers are being stored in ~/.viminfo, and will be loaded again on next restart of vim.
-   Tip: Register 0 contains always the value of the last yank command.

### MARKS:

-   `:marks` โ List of marks
-   `ma` โ Set current position for mark A
-   ``a` โ Jump to position of mark A
-   `y`a` โ Yank text to position of mark A

### MACROS:

-   `qa` โ Record macro a
-   `q` โ Stop recording macro
-   `@a` โ Run macro a
-   `@@` โ Rerun last run macro

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Vim Configuration</summary>

### Refferences:

-   [[notes_vim2]]
-   ref: https://realpython.com/vim-and-python-a-match-made-in-heaven/
-   ๐ฅ ๐ฅ ref: https://stackoverflow.com/questions/5400806/what-are-the-most-used-vim-commands-keypresses/5400978#5400978
-   ๐ฅ ref: https://www.radford.edu/~mhtay/CPSC120/VIM_Editor_Commands.htm

-   [10 Advanced Vim Features](https://www.youtube.com/watch?v=gccGjwTZA7k)
-   [My Favorite Vim Tricks](https://www.youtube.com/watch?v=B-EPvfxcgl0&t=290s)
-   [50+ Vim Tips and Tricks from Beginner to Expert](https://www.youtube.com/watch?v=ZEIpdC_klDI)

### Tutorials:

-   [NeuralNine/Awesome Neovim Setup From Scratch - Full Guide](https://www.youtube.com/watch?v=JWReY93Vl6g)
-   [Neovim from Scratch](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
    -   [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
-   [Neovim](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg)
-   [Vimscript](https://www.youtube.com/watch?v=px74GhBAG9I)
-   [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
-   [Vim Configurations](https://www.youtube.com/watch?v=n9k9scbTuvQ&list=PLm323Lc7iSW9kRCuzB3J_h7vPjIDedplM&index=4):
-   [NeoVim Configuration](https://www.youtube.com/watch?v=DogKdiRx7ls&t=516s):

-   [NeuralNine/Vim](https://www.youtube.com/playlist?list=PL7yh-TELLS1Eevqs4-XmlSfrFOKb5C97K)
    -   [GitHub/config](https://github.com/NeuralNine/config-files)

### Config Files

-   `~/.vimrc` โ Configuration file for `vim`.
-   `~/.config/nvim/init.vim` โ Configuration File for `Neovim`.
-   `~/.config/nvim/plugged` โ Plug-ins Folder for `Neovim`.
-   `~/.local/share/nvim/site/autoload/plug.vim` โ Autoload file for `Neovim`

**NOTES**

-   `:version` โ Spits out which version of vim you are using.
-   `:options` โ Seeking help on options
-   `:h tabstop` โ Seeking help on 'tabstop' option.
-   `:echo has('python3')`
-   `:checkhealth`

-   How to use vim-plug:

    -   Download the vim plugins manager called **[vim-plug](https://github.com/junegunn/vim-plug)** from git hub. Then use following comands to manage your vim plugins.
    -   `:PlugInstall` โ Install plugins
    -   `$ vim +PlugInstall +qall` โ Install vim plugins from terminal.
    -   `:PlugUpdate` โ Update plugins๏ผ
    -   `:PlugClean` โ Remove plugins๏ผ (Before run this command, comment the plugin install command in init.vim)
    -   `:PlugStatus` โ Check the plugin status๏ผ
    -   `:PlugUpgrade` โ Upgrade vim-plug itself๏ผ

-   How to use [coc commands]():

    -   `:CocConfig`
    -   `CocInstall coc-python`
    -   `CocCommand`

    -   `:! python file_name.py` โ Run python file from vim.
    -   `: echo has('clipboard')`

    -   `:help popupmenu-completion`
    -   `:help popupmenu-keys`
    -   `$ brew install ctags`

### [Technical Problems](https://superuser.com/questions/1115159/how-do-i-install-vim-on-osx-with-python-3-support):

#### Python Integration of Vim:

-   [A setup for python](https://github.com/Optixal/neovim-init.vim)
-   [Setup Neovim for Python](https://yufanlu.net/2018/09/03/neovim-python/)
-   [Python in Vim](https://jdhao.github.io/2019/04/22/mix_python_and_vim_script/):
-   [Vim as an Python IDE](https://medium.com/nerd-for-tech/vim-as-an-ide-for-python-2021-f922da6d2cfe)

## </details>

---

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Tmux</summary>

</details>
