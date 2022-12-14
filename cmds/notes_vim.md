-   𝑳𝒊𝒔𝒕 𝒐𝒇 𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⮐ ⎇ ⬆︎ ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ 🎾 & 🔥

---

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Vim Shortcutes</summary>

-   `<Space> n` → Toggle folder/file explorer
-   `<Space> t` → Toggle Tagbar
-   `<Space> m` → Toggle mouse ON/OFF

-   How to comment out multiple lines?

```
1. marks lines
2. `:/s/^/#`
    - `⬆︎+:` to get `:`
    - '#' is comenting character.
    - '^' is indication of beginning of line as regex.
```

---

### EXITING:

-   `:q! or ZQ` → Quit and throw away unsaved changes
-   `:q` → Quit (fails if there are unsaved changes)
-   `:w` → Write (save) the file, but don’t exit
-   `:w !sudo tee %` → Write out the current file using sudo
-   `:wq` / `:x` / `ZZ` → Write (save) and quit
-   `:source %` → source (`run`) the current file (lua files) you are working on.
-   i + gt (i in [1-9]) → Focus i-th buffer (Vim Tab)
-   `<SPACE> + [` / `<SPACE> + ]` → Changes the focus across the Buffer (Vim Tab)
-   Usage of: `f,t,w,b,%,h,j,k,l`
-   `v` → to select range of text
    -   After selecting the text, try d to delete, or y to copy, or :s/match/replace/, or :center, or !sort, or...
-   🔥`⬆︎ + v` → to select a line.
-   `⌃ + v` → to select columns of text
-   `yiw` → copy the word where the curson on
-   `:m 12` → move current line to after line 12
-   `:5,7m 21` → move lines 5, 6 and 7 to after line 21
-   `:/pattern + ⮐` → Highlight the pattern.
    -   `n` / `shift+n` → to hop over the highlighted patterns.
-   `shift + *`/`shift + #` → Search for the word currently cursor is in.Repeat to get the next/previous occurance
-   `x` → to cut character.
-   `g;` → to go through changes in backward
-   `g,` → to go through changes in forword
-   `~` → to switch cases
-   `:changes` → to see all the changes
-   `:jumps`

---

🔥 Tip: Prefix a cursor movement command with a number to repeat it. For example, 4j moves down 4 lines.

### ENTERING INTO INSERT MODE:

-   `🔥 i` → Insert `before the focused character`.
-   `🔥 a` → Insert (append) `after the focused character`.
-   `🔥 o` → Append (open) a new line `below the current line`.
-   `🔥 I` → Insert at the `beginning of the line`
-   `🔥 A` → Insert (append) `at the end of the line`
-   `🔥 O` → Append (open) a new line `above the current line`.
-   `ea` → Insert (append) `at the end of the word`
-   `Esc` → Exit insert mode

### CUT AND PASTE IN NORMAL MODE:

-   `yy` → Yank (copy) a line
-   `2yy` → Yank (copy) 2 lines
-   `yw` → Yank (copy) the characters of the word from the cursor position to the start of the next word
-   `y$` → Yank (copy) to end of line
-   `:%y+` → Yank the whole file
-   `p` → Put (paste) the clipboard after focused character.
-   `P` → Put (paste) before focused character.
-   `dd` → Delete (cut) a line
-   `2dd` → Delete (cut) 2 lines
-   `dw` → Delete (cut) the characters of the word from the cursor position to the start of the next word
-   `D` → Delete (cut) to the end of the line
-   `d$` → Delete (cut) to the end of the line
-   `x` → Delete (cut) character

### EDITING IN NORMAL MODE:

-   `V` → Sellect the line of which the cursor is on
-   `🔥 J` → join line below to the current line
-   `🔥 u` → undo
-   `🔥 Ctrl + r` → redo
-   `🔥 .` → repeat last command
-   `r` → replace a single character
-   `cc` → change (replace) entire line
-   `cw` → change (replace) to the end of the word
-   `c$` → Change (replace) to the end of the line
-   `s` → Delete character and substitute text
-   `S` → Delete line and substitute text (same as cc)
-   `🔥 xp` → Transpose two letters (delete and paste)

### CURSOR MOVEMENTS:

-   `h` → Move cursor left
-   `j` → Move cursor down
-   `k` → Move cursor up
-   `l` → Move cursor right
-   `H` → Move to top of screen
-   `M` → Move to middle of screen
-   `L` → Move to bottom of screen
-   `🔥 w` → Jump forwards to the start of a word
-   `W` → Jump forwards to the start of a word (words can contain punctuation)
-   `🔥 e` → Jump forwards to the end of a word
-   `E` → Jump forwards to the end of a word (words can contain punctuation)
-   `b` → Jump backwards to the start of a word
-   `B` → Jump backwards to the start of a word (words can contain punctuation)
-   `0` → Jump to the start of the line
-   `🔥 ^` → Jump to the first non-blank character of the line
-   `🔥 $` → Jump to the end of the line
-   `🔥 g_` → Jump to the last non-blank character of the line
-   `🔥 gg` → Go to the first line of the document
-   `🔥 G` → Go to the last line of the document
-   `🔥 5G` → Go to line 5
-   `🔥 fx` → Jump to next occurrence of character x
-   `🔥 tx` → Jump to before next occurrence of character x
-   `}` → Jump to next paragraph (or function/block, when editing code)
-   `{` → Jump to previous paragraph (or function/block, when editing code)
-   `zz` → Center cursor on screen
-   `Ctrl + b` → Move back one full screen
-   `Ctrl + f` → Move forward one full screen
-   `🔥 Ctrl + d` → Move forward 1/2 a screen
-   `🔥 Ctrl + u` → Move back 1/2 a screen

### VISUAL COMMANDS:

-   `>` → Shift text right
-   `<` → Shift text left
-   `y` → Yank (copy) marked text
-   `d` → Delete marked text
-   `🔥 ~` → Switch case

### SEARCH AND REPLACE:

-   `🔥 /pattern` → Search for pattern
-   `🔥 ?pattern` → Search backward for pattern
-   `\vpattern` → ‘Very magic’ pattern: non-alphanumeric characters are interpreted as special regex symbols (no escaping needed)
-   `n` → Repeat search in same direction
-   `N` → Repeat search in opposite direction
-   `:/pattern + ⮐` → Highlight the pattern.
    -   `n` / `shift+n` → to hop over the highlighted patterns.
-   `shift + *`/`shift + #` → Search for the word currently cursor is in.Repeat to get the next/previous occurance
-   `🔥 :%s/old/new/g` → Replace all old with new throughout file
-   `🔥 :%s/old/new/gc` → Replace all 'old' with 'new' throughout file with confirmations
-   `:noh` → Highlighting of search matches

### SEARCH IN MULTIPLE FILES:

-   `:vim[grep] /pattern/ {`{file}`}`
-   `:vimgrep /pattern/ {file}` → Search for pattern in multiple files (EX: `:vimgrep /foo/ **/*`)
-   `:cn` → Jump to the next match
-   `:cp` → Jump to the previous match
-   `:copen` → Open a window containing the list of matches

### WORKING WITH MULTIPLE FILES:

-   `:e file` → Edit a file in a new buffer
-   `:bnext or :bn` → Go to the next buffer
-   `:bprev or :bp` → Go to the previous buffer
-   `:bd` → Delete a buffer (close a file)
-   `:ls` → List all open buffers
-   `:sp file` → Open a file in a new buffer and split window
-   `:vsp file` → Open a file in a new buffer and vertically split window
-   `Ctrl + ws` → Split window
-   `Ctrl + ww` → Switch windows
-   `Ctrl + wq` → Quit a window
-   `Ctrl + wv` → Split window vertically
-   `Ctrl + wh` → Move cursor to the left window (vertical split)
-   `Ctrl + wl` → Move cursor to the right window (vertical split)
-   `Ctrl + wj` → Move cursor to the window below (horizontal split)
-   `Ctrl + wk` → Move cursor to the window above (horizontal split)

### TABS:

-   `🔥 :tabnew or :tabnew file`
    -   open a file in a new tab
-   `Ctrl + wT`
    -   move the current split window into its own tab
-   `🔥 gt or :tabnext or :`tabn
    -   move to the next tab
-   `🔥 gT or :tabprev or :tabp`
    -   move to the previous tab
-   `🔥 #gt`
    -   move to tab number #
-   `:tabmove #`
    -   move current tab to the #th position (indexed from 0)
-   `🔥 :tabclose or :tabc`
    -   close the current tab and all its windows
-   `:tabonly or :tabo`
    -   close all tabs except for the current one
-   `:tabdo command`
    -   run the command on all tabs (e.g. :tabdo q
    -   closes all opened tabs)

### MARKING TEXT (VISUAL MODE):

-   `v` → Start visual mode, mark lines, then perform an operation (such as d-delete)
-   `V` → Start linewise visual mode
-   `Ctrl + v` → Start blockwise visual mode
-   `o` → Move to the other end of marked area
-   `O` → Move to other corner of block
-   `aw` → Mark a word
-   `ab` → A block with ()
-   `aB` → A block with {}
-   `ib` → Inner block with ()
-   `iB` → Inner block with {}
-   `Esc` → Exit visual mode

### GLOBAL:

-   `:help keyword` → Open help for keyword
-   `:o file` → Open file
-   `:saveas file` → Save file as
-   `:close` → Close current window

### REGISTERS:

-   `:reg` → Show registers content
-   `"xy` → Yank into register x
-   `"xp` → Paste contents of register x

-   Tip: Registers are being stored in ~/.viminfo, and will be loaded again on next restart of vim.
-   Tip: Register 0 contains always the value of the last yank command.

### MARKS:

-   `:marks` → List of marks
-   `ma` → Set current position for mark A
-   ``a` → Jump to position of mark A
-   `y`a` → Yank text to position of mark A

### MACROS:

-   `qa` → Record macro a
-   `q` → Stop recording macro
-   `@a` → Run macro a
-   `@@` → Rerun last run macro

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Vim Configuration</summary>

### Refferences:

-   [[notes_vim2]]
-   ref: https://realpython.com/vim-and-python-a-match-made-in-heaven/
-   🔥 🔥 ref: https://stackoverflow.com/questions/5400806/what-are-the-most-used-vim-commands-keypresses/5400978#5400978
-   🔥 ref: https://www.radford.edu/~mhtay/CPSC120/VIM_Editor_Commands.htm

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

-   `~/.vimrc` → Configuration file for `vim`.
-   `~/.config/nvim/init.vim` → Configuration File for `Neovim`.

**NOTES**

-   `:version` → Spits out which version of vim you are using.
-   `:options` → Seeking help on options
-   `:h tabstop` → Seeking help on 'tabstop' option.
-   `:echo has('python3')`
-   `:checkhealth`

-   How to use vim-plug:

    -   Download the vim plugins manager called **[vim-plug](https://github.com/junegunn/vim-plug)** from git hub. Then use following comands to manage your vim plugins.
    -   `:PlugInstall` → Install plugins
    -   `$ vim +PlugInstall +qall` → Install vim plugins from terminal.
    -   `:PlugUpdate` → Update plugins：
    -   `:PlugClean` → Remove plugins： (Before run this command, comment the plugin install command in init.vim)
    -   `:PlugStatus` → Check the plugin status：
    -   `:PlugUpgrade` → Upgrade vim-plug itself：

-   How to use [coc commands]():

    -   `:CocConfig`
    -   `CocInstall coc-python`
    -   `CocCommand`

    -   `:! python file_name.py` → Run python file from vim.
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
