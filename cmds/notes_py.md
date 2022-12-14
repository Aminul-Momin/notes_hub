-   `$ 𝑳𝒊𝒔𝒕 𝒐𝒇 𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔:`
    ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ⭿ ♥ ★ 🎾 &

### PYTHON3 COMMANDS:

-   MY PYTHON EXECUTABLES:

    -   `/usr/local/Cellar/python3/3.7.3/bin`
    -   `/Library/Frameworks/Python.framework/Versions`
    -   `/usr/local/Cellar` → paths of various python versions.
    -   `/usr/local/opt/` → These python executables are actually symlinks of python in `/usr/local/Cellar`
    -   `/usr/local/opt/python@3.9/bin/python3.9` → PATH of python3.9:

-   [Corey: How to Set the Path and Switch Between Different Versions/Executables (Mac & Linux)](https://www.youtube.com/watch?v=PUIE7CPANfo&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=14&t=1218s)
-   `$ type python`
-   `$ which -a python3` → locate all (-a) python3 file in the user's path

-   `$ python`

```python
>>> import sys
>>> sys.executable
'/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
```

-   `$ python3 -V` → Version of the current executalbe python3.
-   `$ whereis python3` → /usr/bin/python3
-   `$ echo $PATH` → show the path variable of my machine.
-   `$ type python3` → python3 is hashed (/usr/local/bin/python3)
-   `$ man python3`
-   `$ python3 module_name.py [arg1, ..., argn]` → Run python file from command line
-   🔥 `$ python3 -m pydoc <package_name>` → print out the documents of the given package.
-   🔥 `$ python3 -m site` → print the path of python3's site-packages
-   `$ python3 -m site --user-base`
-   `$ python3 setup.py install --prefix=~`
    -   'cd' into the module directory that contains setup.py and run the install command above.
    -   Instalation of dependencies through the setup.py file of the given project
-   `$ python3 setup.py -q deps` → show available dependency groups
-   `$ python3 setup.py -q deps --dep-groups=core,vision` → print dependency list for specified groups
-   `$ python3 setup.py -q deps --help` → see all options
-   `$ python3 setup.py sdist bdist_wheel`
-   🔥 `$ pip3 install -e .` → Install a custom package in editable mode.
-   Installing a Bash Kernel:

    -   `$ python -m venv .venv`
    -   `$ source .venv/bin/activate`
    -   `$ pip install bash_kernel`
    -   `$ pip install ipykernel`
    -   `$ python -m bash_kernel.install`
    -   `$ rm -fr bash_kernel`

-   Run Jupyter from Virtual Environment:

    -   `$ python -m venv .venv`
    -   `$ source .venv/bin/activate`
    -   `$ pip install ipykernel`
    -   `$ ipython kernel install --user --name=jnb_flaskapp_env`
    -   `$ jupyter notebook`
        -   select `jnb_flaskapp_env` from select manu of jupyter karnel.
    -   Installed kernelspec jnb_flaskapp_env in /Users/a.momin/Library/Jupyter/kernels/jnb_flaskapp_env

-   `$ jupyter kernelspec list `
-   `$ jupyter kernelspec remove kernel_name`

### pyenv:

-   `$ brew install pyenv`
-   `$ brew install pyenv-virtualenv` → [Install pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

    -   `$ pyenv virtualenvs`
    -   `$ pyenv activate <virtualenv_name>`
    -   `$ pyenv deactivate`
    -   `$ pyenv virtualenv-delete virtualenv_name`

-   [pyenv doc](https://github.com/pyenv/pyenv-installer)
-   [How to Install and Run Multiple Python Versions on macOS](https://www.youtube.com/watch?v=31WU0Dhw4sk)
-   `$ pyenv` → list out all _pyenv_ commands.
-   `$ pyenv help <command>` → Provide information on the specified command.
-   `$ pyenv versions` → List out all the installed python versions in your machine.
-   `$ pyenv install -l` → List out all the python versions available to install.
-   `$ pyenv install 3.9.7` → Install python3.9.7 through pyenv.
-   `$ pyenv global 3.9.7` → Set the given python version as your global python.
-   `$ pyenv install 3.10.0rc2` → Install latest release candidate (rc) of your current python version.
-   `$ pyenv local 3.10.0rc2` → Install latest release candidate as dot python version for this project.
-   `$ python -m venv .venv` → Create python environment from the `..python` version.
-   `$ pyenv `
-   `$ pyenv `
-   `$ `

-   Some useful pyenv commands are:
    -   `$ pyenv --version` → Display the version of pyenv
    -   `$ pyenv commands` → List all available pyenv commands
    -   `$ pyenv exec` → Run an executable with the selected Python version
    -   `$ pyenv global` → Set or show the global Python version(s)
    -   `$ pyenv help` → Display help for a command
    -   `$ pyenv hooks` → List hook scripts for a given pyenv command
    -   `$ pyenv init` → Configure the shell environment for pyenv
    -   `$ pyenv install` → Install a Python version using python-build
    -   `$ pyenv latest` → Print the latest installed or known version with the given prefix
    -   `$ pyenv local` → Set or show the local application-specific Python version(s)
    -   `$ pyenv prefix` → Display prefixes for Python versions
    -   `$ pyenv rehash` → Rehash pyenv shims (run this after installing executables)
    -   `$ pyenv root` → Display the root directory where versions and shims are kept
    -   `$ pyenv shell` → Set or show the shell-specific Python version
    -   `$ pyenv shims` → List existing pyenv shims
    -   `$ pyenv uninstall` → Uninstall Python versions
    -   `$ pyenv version` → Show the current Python version(s) and its origin
    -   `$ pyenv version-file` → Detect the file that sets the current pyenv version
    -   `$ pyenv version-name` → Show the current Python version
    -   `$ pyenv version-origin` → Explain how the current Python version is set
    -   `$ pyenv versions` → List all Python versions available to pyenv
    -   `$ pyenv whence` → List all Python versions that contain the given executable
    -   `$ pyenv which` → Display the full path to an executable

### PIP3 (PYTHON PACKAGE MENEGER):

-   `$ pip3 -V` → Version of the pip3
-   `$ type pip3` → pip3 is `/usr/local/bin/pip3`
-   `$ sudo -H pip3 install --upgrade pip3`
-   🔥 `$ python3 -m pip install --upgrade pip`
-   `$ python3 -m pip uninstall pip`
-   `$ pip3 <command> [options]`

---

-   HELP:
    -   `$ pip3 -h`
    -   `$ pip3 <command> -h` → EX: `$ pip3 install -h`
-   `$ pip3 help` → Prints out all the availabel commands can be used in conjunction with pip3.
-   `$ pip3 <comand_name> help | -h` → Apply help command to the specified pip command. Ex. pip3 install -h. NOTE: The vertical var, '|', indicate 'OR'
-   `$ pip3 help install` → Provide help with pip3 'install' command.

---

-   `$ pip3 show <package_name>`
-   `$ pip3 show numpy`
-   `$ pip3 search <package_name>` → Ex. pip3 search numpy
-   `$ pip3 list`
-   `$ pip3 list [--outdated | -o]`
-   `$ pip3 list --local`
-   `$ pip3 install selenium -U NOTE: -U` → Update
-   `$ pip3 install -r requirements.txt` → Install all the packages mentioned in the 'requirment.txt' file.
-   🔥 `$ pip3 uninstall -r requirements.txt` → Uninstall all the packages listed in the given requirements file
-   `$ pip3 install numpy`
-   `$ pip3 show numpy`
-   `$ pip3 uninstall --user selenium`
-   `$ pip3 uninstall [options] <package> ...`
-   `$ pip3 uninstall [options] -r <requirements file> ...`
-   `$ pip3 freeze` → to displey the list of dependencies that you'd used in a requirements.txt file
-   `$ pip3 freeze > requirements.txt` → create the requirements.txt file with the list of dependencies recorded in the current env.
-   `$ pip3 install -r requirements.txt` → install the dependencies recorded in requirement.txt into the environment
-   🔥 `$ pip3 install -e .` → Install a custom package in editable mode.

### ANACONDA

-   [ANACONDA Documentations](https://conda.io/projects/conda/en/latest/user-guide/index.html)
-   [Corey Schafer: How to manage multiple version and environments of python](https://www.youtube.com/watch?v=cY2NXB_Tqq0)
-   path = `/Users/a.momin/opt/anaconda3`
-   `$ conda install bash_kernel -c conda-forge`

-   #### conda help:

    -   `$ conda -h`
    -   `$ conda <command> -h` → EX. conda remove -h
    -   `$ conda create -H`
    -   `$ conda env -h`
    -   `$ conda env remove -h`
    -   `$ conda config remove -h`

-   #### conda config:

    -   `$ conda config --describe [DESCRIBE [DESCRIBE ...]]` → Describe given configuration parameters. If no arguments given, show information for all configuration parameters.
    -   `$ conda config --set auto_activate_base false` → To prevent Conda from activating the base environment by default?
    -   `$ conda config --add channels conda-forge` → Add the conda-forge channel:
    -   `$ conda config --show channels` -

-   FastAI:

    -   git clone https://github.com/fastai/fastai.git
    -   cd fastai

-   `$ conda activate fastai-cpu`
-   `$ 🔥 conda info`
-   `$ 🔥 conda info --envs` → To see a list of all of your environments

-   #### conda env:

    -   `$ 🔥 conda env list` → To see a list of all of your environments
    -   `$ 🔥 conda env export > environent.yml` → export virtual environent into environent file.
    -   `conda env create`:
        -   `$ 🔥 conda env create -f environment-cpu.yml` → Create a new python project environment using conda package manager
        -   `$ 🔥 conda env create -f bio-env.txt -n env_name` → Create a new project environment using text file.
    -   `conda env remove`:
        -   `$ 🔥 conda env remove --name environent_name` → Remove/Delete the environment by the name `environent_name`

-   #### conda create/remove:
    -   `$ conda create -n env_name -y` → Create a environment with the given name, env_name
    -   `$ conda create --name conda_env_name <first_pkg second_pkg ...>`
    -   `$ conda create --name bio-env biopython` → Stack commands: create a new environment, name it bio-env and install the biopython package
    -   `$ conda create --name conda_env_name27 python=2.7 <a_pythone_package>` → Create a new python 2.7 project environment using conda package manager
    -   `$ conda remove --name conda_env_name --all` → Remove the specified environment
    -   `$ conda remove --name conda_env_name <package_name>` → Remove the specified package_name from specified environment.
-   🔥 `$ conda list` → list out the packages in the current environments
-   `$ conda list --explicit > pkgs.txt` → Export an environment with exact package versions for one OS
-   🔥 `$ conda list --export > requirements.txt`
-   `$ conda update -n base -c defaults conda`
-   `$ conda activate conda_env_name` → To activate this environment. Ex. conda activate fastai-cpu
-   `$ source activate conda_env_name` → To activate the environent
-   `$ conda deactivate` → To deactivate an active environment
-   `$ source deactivate` → To deactivate an active environment
-   `$ conda install -c pytorch pytorch`

##### [How to Manage Multiple Projects, Virtual Environments, and Environment Variables](https://www.youtube.com/watch?v=cY2NXB_Tqq0&list=PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU&index=16)

-   Create a bash file in corresponding conda environment.
    -   mkdir -p /Users/a.momin/opt/anaconda3/envs/fastai/etc/conda/activate.d
    -   mkdir -p /Users/a.momin/opt/anaconda3/envs/fastai/etc/conda/deactivate.d
    -   touch /Users/a.momin/opt/anaconda3/envs/fastai/etc/conda/activate.d/env_vars.sh
        -   #!/bin/sh
        -   export SECRET_KEY='SDFLKJ;LASKJF;LAKSD;L'
        -   export DATABASE_URI="postgresql://user:pass@bd_server:5432/test_db"
    -   touch /Users/a.momin/opt/anaconda3/envs/fastai/etc/conda/deactivate.d/env_vars.sh
        -   #!/bin/sh
        -   unset SECRET_KEY
        -   unset DATABASE_URI

### python3 Virtual Environment: (python version ≥ 3.3)

-   [How to Use Virtual Environments with the Built-In venv Module](https://www.youtube.com/watch?v=Kg1Yvry_Ydk&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=25&t=0s)

-   `$ HELP:` → python3 -m venv -h
-   `$ python3 -m venv project_env ` → Create an python3 environment with named project_env
-   `$ source project_env/bin/activate ` → activate the environment
-   `$ deactivate ` → deactivate the active environment
-   `$ python3 -m venv project_env/venv ` → to keep the environment seperate from the project itself.
-   `$ source project_env/venv/bin/activate`
-   `$ which python`
-   `$ pip3 freeze ` → to displey the list of dependencies that you'd used in a requirement.txt file
-   `$ pip3 freeze > requirement.txt ` → create the requirement.txt file with the list of dependencies recorded in the current env.
-   `$ rm -rf project_env ` → to delete the environment, project_env
-   `$ pip3 install -r requirement.txt ` → install the dependencies recorded in requirement.txt into the environment
-   `$ python3 -m venv project_name_env --system-site-packages`
-   `$ pip3 list --local`

-   How to create python environment from requirment.txt (Python >= 3.6.x):
    -   cd my_project
    -   sudo pip install virtualenv # This may already be installed
    -   virtualenv .env # Create a virtual environment
    -   source .env/bin/activate # Activate the virtual environment
    -   pip install -r requirements.txt # Install dependencies
    -   Work on the assignment for a while ...
    -   deactivate # Exit the virtual environment

### pipenv (available for python version ≥ 3.3)

-   [Corey: Easily Manage Packages and Virtual Environments](https://www.youtube.com/watch?v=zDYL22QNiWk&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7&index=23&t=672s)
-   [Pipenv & Virtual Environments](https://pipenv-fork.readthedocs.io/en/latest/install.html#installing-pipenv)
-   `$ NOTE: pipenv should be added to the PATH in order to pipenv be recognized by Terminal.`

-   Important Pipenv related paths:

-   `/Users/a.momin/.local/share/virtualenvs`
-   `$ pip3 install pipenv`
-   `$ pipenv --python 3.7`
    -   `$ pipenv --python /usr/local/Cellar/python@3.9/3.9.13_1/Frameworks/Python.framework/Versions/3.9/bin/python3.9`
    -   `$ pipenv --python /usr/local/Cellar/python@3.10/3.10.4/bin/python3.10`
    -   Create a new project using Python 3.7, specifically
-   `$ pipenv --help | -h`
-   `$ pipenv --py`
-   `$ pipenv --venv`
    -   Returns the path of activated environment (pipenv)
    -   Output Python interpreter information.
-   `$ pipenv install` → create pip env and install packages from pipfile.lock
-   `$ pipenv install requests`
-   `$ pipenv uninstall requests`
-   `$ exit` → deactivate environment
-   `$ pipenv shell` → To activate this project in the virtualenv
-   `$ pipenv run` → Alternative to <pipenv shell>, run a command inside the virtualenv
-   `$ pipenv run python`
-   `$ pipenv run python script.py` → run script.py in context of env. without activating it.
-   `$ pipenv install -r ../requirment.txt` → install several packages from existing project using requirment.txt (a text file containing list of dependencies a project needs) file
-   `$ pipenv lock -r`
-   `$ pipenv install pytest --dev` → way to keep dev packages seperate from build packages
-   `$ pipenv --python 3.6` → change the python version to 3.6 in the env from existing version. Before running the command mannual change is need inside the pipfile: existing version to 3.6
-   `$ pipenv --rm` → remove the the environment. Note: the Pipfile is not removed.
-   `$ pipenv --venv` → path to the virtual env
-   `$ pipenv check`
-   `$ pipenv install` → install from the `Pipfile`
-   `$ pipenv graph` → Show a graph of your installed dependencies
-   `$ popenv lock`
-   `$ pipenv install --ignore-Pipfile`

### python2 Virtual Environment:

-   [Corey: virtualenv and why you should use virtual environments](https://www.youtube.com/watch?v=N5vscPTWKOk&t=371s)

-   `$ pip install --upgrade pip`
-   `$ pip install virtualenv`

-   `$ virtualenv project1_env`
-   `$ source project1_env/bin/activate`
-   `$ which pip` → run the command from the newly created env
-   `$ which python` → run the command from the newly created env

-   `$ pip freeze --local > requirement.txt`
-   `$ cat requirement.txt`

-   `$ deactivate` → Run the command to deactivate the environment
-   `$ rm -fr project1_env` → Delate the environment. Note: requirement.txt file is not deleted.

-   `$ virtualenv -p /usr/bin/python2.7 project_pp2_env`
-   `$ source project_pp2_env/bin/activate`
-   `$ pip install -r requirement.txt` → install all packages listed in requirement.txt into the environment.
