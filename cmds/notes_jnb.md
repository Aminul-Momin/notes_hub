-   𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⮐ ⎇ ⬆︎ ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ 🎾 &

-   [Documentations: Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/latest/?badge=latest)
-   [Deploy A Jupyter Notebook Server into Production using Docker & Heroku](https://www.youtube.com/watch?v=GoJ6qR2VMTA)
-   [How to install Bash Kernel](http://slhogle.github.io/2017/bash_jupyter_notebook/)
-   [IPython Doc](https://ipython.readthedocs.io/en/stable/interactive/tutorial.html#)
-   [IPython Doc](https://ipython.org/documentation.html)

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Terminology</summary>

-   MAGIC:

    -   Magic commands come in two flavors: line magics, which are denoted by a
    -   single '%' prefix and operate on a single line of input, and cell magics, which
    -   are denoted by a double '%%' prefix and operate on multiple lines of input.

-   LINE MAGIC:

    -   They are similar to command line calls.
    -   They start with % character.
    -   Rest of the line is its argument passed without parentheses or quotes.
    -   Line magics can be used as expression and their return value can be assigned to variable.

-   CELL MAGIC:

    -   They have '%%' character prefix.
    -   They can operate on multiple lines below their call.

-   `%magicfunction?` → Information of a given 'magicfunction' is printed.
-   `!` → Bash Command Prefix
-   `%` → line magic indicator
-   `%%` → cell magic indicator
-   `%lsmagic` → list out all the magic commands available to be used.
-   `%matplotlib inline` → %matplotlib inline sets the backend of matplotlib to the 'inline' backend: With this backend, the output of plotting commands is displayed inline within frontends like the Jupyter notebook, directly below the code cell that produced it.

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Installation & Configurations:</summary>

### Installation and Configurations

-   `$ python3 -m pip install jupyter` → install Jupyter Notebook
-   `$ pip3 install --upgrade notebook` → Upgrade Jupyter Notebook
-   `$ pip install notebook`

-   `$ jupyter notebook` → start server of jupyter notebook at port-8888.
-   🔥 `$ jupyter notebook --help`
-   `$ jupyter notebook --help-all`
-   🔥 `$ jupyter --path`
-   🔥 `$ jupyter notebook --generate-config` → Create a `jupyter_notebook_config.py` file in the `.jupyter` directory, with all the defaults configurations commented out.

-   `$ jupyter kernelspec list `
-   `$ jupyter kernelspec remove kernel_name`

-   🔥 `$ pip install ipykernel`
-   🔥 `$ ipython kernel install --user --name=ads_jnb_kernel`

### ENABLE NOTEBOOK EXTENSION & THEMES:

-   `$ pip install jupyter_contrib_nbextensions` → Install the extention
-   `$ jupyter contrib nbextension install --user` → Setup the configuration
-   `$ jupyter nbextension enable <nbextension require path>` → Enable the extension
-   `$ pip install jupyterthemes` → install jupyterthemes
-   `$ pip install --upgrade jupyterthemes` → upgrade to latest version
-   `$ jt -l` → List out all the available themes available in package called 'jupyterthemes'
-   `$ jt -t onedork` → Enable 'onedork' theme
-   `$ jt -r` → Reset the theme of this notebook to default setting.

-   It’s time to make your jupyter notebook cool again. One can customize each and every aspect of the notebooks. Lets start with customizing colours. On both windows and linux (ubuntu), the process is fairly straight.
-   Customizing colours:
    -   Go to user directory for whom jupyter is installed.
    -   Find directory named `.jupyter`. Note that you may find another folder named `.ipython` in the same directory. IPython is now the Jupyter project.
    -   Create folder named custom in the `.jupyter` directory.
    -   Create a CSS file in the custom directory. Name it custom.css.
    -   Open up your favourite editor. Start adding style to this file.

### Important Files:

-   `~/.jupyter/custom/custom.js` → a special file to tweak the jupyter notebook setup
-   `~/.jupyter/nbconfig/notebook.json` → another special file to tweak the jupyter setup
-   `/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/jupyter_contrib_nbextensions`

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Usefull JNB Shortcuts:</summary>

### USEFULL JUPYTER TRICKS:

-   `<Function_name> + ⬆︎ + ⮐` → Show where the the given function, 'Function_name', from.
-   `? <Function_name>` → Pirnt out the doc string of the given 'Function_name'.
-   `?? <Function_name>` → Print out the source code for the given 'Function_name'.
-   🔥 `⬆︎ + tab` → Pirnt the short version of document string.
-   🔥 `⬆︎ + tab + tab` → Pirnt the long version of the document string.
-   `⬆︎ + tab + tab + tab` →
-   `⎇ + tab ` → Auto Completion
-   `^ + ⬆︎ + -` → Split cell into two cells
-   `Hold down 'alt'` → Use multiple cursors
-   `Cmd + '[' / ']'` → Indent / dedent line
-   `%load <path/python_file.py>`
-   `%run <path/python_file.py>` → Execute a python script from jupyter notebook cell.
-   `%run -i <path/python_file.py>` → Import custom python script file
-   `!` → bash command prrefix in JNB. The exclamatory symbol is followed by a bash command. (`!pwd`, `!ls`, `!cd`)

### SHORTCUTS:

-   `⌃ + ⮐` → run selected cell
-   `⬆︎ + ⮐` → run cell, select below
-   `⎇ + ⮐` → run cell and insert below
-   `A` → insert empty cell above
-   `B` → insert empty cell below
-   `Y` → change selected markdown cell into code cell.
-   `M` → change code-type-cell to markdown-type-cell
-   `dd` → delete selected cell
-   `J` → move cell selection up
-   `K` → move cell selection down
-   `c` → copy selected cell
-   `x` → cuts selected cell
-   `v` → paste after the selected cell
-   `z` → undo the last operation
-   `⬆︎ + ^ + <-` → collapse all the heading
-   `⬆︎ + ^ + ->` → expand all the heading
-   `<-` → collapse the heading of the selected.
-   `->` → expand the selected heading
-   `⬆︎ + ->` / `->` → select cells
-   `⬆︎ + m` → merges selected cells
-   `⬆︎ + ^ + -` → splits the cell at the cursor's position
-   `f` → find and replace in selected cells
-   `1` → change cell to heading 1 (not in VSC)
-   `2` → change cell to heading 2 (not in VSC)
-   `3` → change cell to heading 3 (not in VSC)
-   `4` → change cell to heading 4 (not in VSC)
-   `5` → change cell to heading 5 (not in VSC)
-   `6` → change cell to heading 6 (not in VSC)

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">MISC</summary>

<!-- #  Running Jupyter Notebook on an EC2 Server  -->

#!/usr/bin/env bash

# Commands for installing jupyter server in GCP Computee Engine

-   `$ sudo apt-get update`
-   `$ sudo pip install jupyter`
-   `$ jupyter notebook --generate-config`

```python
# vim ~/.jupyter/jupyter_notebook_config.py
c = get_config()
c.NotebookApp.ip = '\*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 1111
```

-   `$ jupyter notebook password`
-   `$ jupyter notebook --ip=0.0.0.0 --port=8886 --no-browser`

 <!-- Running Jupyter Notebook on AWS  -->

jupyter notebook --generate-config

ipython

from IPython.lib import passwd

passwd()

Enter password: [Create password and press enter] Verify password: [Press enter]

'sha1:e8b6afa24b64:608613e172510938d5c357c28a6771c1cfa2d85a'

exit

openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
sudo chown $USER:$USER /home/ubuntu/certs/mycert.pem

ssh -i ~/Desktop/fastai_ml1.pem -N -f -L 8888:localhost:8888 ubuntu@ec2-54-165-14-114.compute-1.amazonaws.com

# </details>
