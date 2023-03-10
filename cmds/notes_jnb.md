-   ๐๐ฌ๐๐๐ฎ๐ฅ๐ฅ ๐บ๐๐๐๐๐๐: โฎ โ โฌ๏ธ โ โฅ + โ + โคถ โง ๏ฃฟ โคถ โฌ โฉ๏ธ โฒ โต โซ โญฟ โฅ โ ๐พ &

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

-   `%magicfunction?` โ Information of a given 'magicfunction' is printed.
-   `!` โ Bash Command Prefix
-   `%` โ line magic indicator
-   `%%` โ cell magic indicator
-   `%lsmagic` โ list out all the magic commands available to be used.
-   `%matplotlib inline` โ %matplotlib inline sets the backend of matplotlib to the 'inline' backend: With this backend, the output of plotting commands is displayed inline within frontends like the Jupyter notebook, directly below the code cell that produced it.

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Installation & Configurations:</summary>

### Installation and Configurations

-   `$ python3 -m pip install jupyter` โ install Jupyter Notebook
-   `$ pip3 install --upgrade notebook` โ Upgrade Jupyter Notebook
-   `$ pip install notebook`

-   `$ jupyter notebook` โ start server of jupyter notebook at port-8888.
-   ๐ฅ `$ jupyter notebook --help`
-   `$ jupyter notebook --help-all`
-   ๐ฅ `$ jupyter --path`
-   ๐ฅ `$ jupyter notebook --generate-config` โ Create a `jupyter_notebook_config.py` file in the `.jupyter` directory, with all the defaults configurations commented out.

-   `$ jupyter kernelspec list `
-   `$ jupyter kernelspec remove kernel_name`

-   ๐ฅ `$ pip install ipykernel`
-   ๐ฅ `$ ipython kernel install --user --name=ads_jnb_kernel`

### ENABLE NOTEBOOK EXTENSION & THEMES:

-   `$ pip install jupyter_contrib_nbextensions` โ Install the extention
-   `$ jupyter contrib nbextension install --user` โ Setup the configuration
-   `$ jupyter nbextension enable <nbextension require path>` โ Enable the extension
-   `$ pip install jupyterthemes` โ install jupyterthemes
-   `$ pip install --upgrade jupyterthemes` โ upgrade to latest version
-   `$ jt -l` โ List out all the available themes available in package called 'jupyterthemes'
-   `$ jt -t onedork` โ Enable 'onedork' theme
-   `$ jt -r` โ Reset the theme of this notebook to default setting.

-   Itโs time to make your jupyter notebook cool again. One can customize each and every aspect of the notebooks. Lets start with customizing colours. On both windows and linux (ubuntu), the process is fairly straight.
-   Customizing colours:
    -   Go to user directory for whom jupyter is installed.
    -   Find directory named `.jupyter`. Note that you may find another folder named `.ipython` in the same directory. IPython is now the Jupyter project.
    -   Create folder named custom in the `.jupyter` directory.
    -   Create a CSS file in the custom directory. Name it custom.css.
    -   Open up your favourite editor. Start adding style to this file.

### Important Files:

-   `~/.jupyter/custom/custom.js` โ a special file to tweak the jupyter notebook setup
-   `~/.jupyter/nbconfig/notebook.json` โ another special file to tweak the jupyter setup
-   `/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/jupyter_contrib_nbextensions`

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Usefull JNB Shortcuts:</summary>

### USEFULL JUPYTER TRICKS:

-   `<Function_name> + โฌ๏ธ + โฎ` โ Show where the the given function, 'Function_name', from.
-   `? <Function_name>` โ Pirnt out the doc string of the given 'Function_name'.
-   `?? <Function_name>` โ Print out the source code for the given 'Function_name'.
-   ๐ฅ `โฌ๏ธ + tab` โ Pirnt the short version of document string.
-   ๐ฅ `โฌ๏ธ + tab + tab` โ Pirnt the long version of the document string.
-   `โฌ๏ธ + tab + tab + tab` โ
-   `โ + tab ` โ Auto Completion
-   `^ + โฌ๏ธ + -` โ Split cell into two cells
-   `Hold down 'alt'` โ Use multiple cursors
-   `Cmd + '[' / ']'` โ Indent / dedent line
-   `%load <path/python_file.py>`
-   `%run <path/python_file.py>` โ Execute a python script from jupyter notebook cell.
-   `%run -i <path/python_file.py>` โ Import custom python script file
-   `!` โ bash command prrefix in JNB. The exclamatory symbol is followed by a bash command. (`!pwd`, `!ls`, `!cd`)

### SHORTCUTS:

-   `โ + โฎ` โ run selected cell
-   `โฌ๏ธ + โฎ` โ run cell, select below
-   `โ + โฎ` โ run cell and insert below
-   `A` โ insert empty cell above
-   `B` โ insert empty cell below
-   `Y` โ change selected markdown cell into code cell.
-   `M` โ change code-type-cell to markdown-type-cell
-   `dd` โ delete selected cell
-   `J` โ move cell selection up
-   `K` โ move cell selection down
-   `c` โ copy selected cell
-   `x` โ cuts selected cell
-   `v` โ paste after the selected cell
-   `z` โ undo the last operation
-   `โฌ๏ธ + ^ + <-` โ collapse all the heading
-   `โฌ๏ธ + ^ + ->` โ expand all the heading
-   `<-` โ collapse the heading of the selected.
-   `->` โ expand the selected heading
-   `โฌ๏ธ + ->` / `->` โ select cells
-   `โฌ๏ธ + m` โ merges selected cells
-   `โฌ๏ธ + ^ + -` โ splits the cell at the cursor's position
-   `f` โ find and replace in selected cells
-   `1` โ change cell to heading 1 (not in VSC)
-   `2` โ change cell to heading 2 (not in VSC)
-   `3` โ change cell to heading 3 (not in VSC)
-   `4` โ change cell to heading 4 (not in VSC)
-   `5` โ change cell to heading 5 (not in VSC)
-   `6` โ change cell to heading 6 (not in VSC)

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
