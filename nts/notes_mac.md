### Termianl:

-   `$ less /var/log/system.log`

#### How to set Bash as your default shell on MaOS

-   `$ cat /etc/shells.` → List available shells by typing
-   `$ chsh -s /bin/bash` → update your account to use bash run

#### Usefull Terminal Commands

-   `$ sudo scutil --set HostName MOS01;sudo scutil --set LocalHostName MOS01;sudo scutil --set ComputerName MOS01` → Change your Computer namte to 'MOS01'
-   `$ whoami` → get current active username
-   `$ id -un` → get current active username
-   `$ open -a Docker` → Open Docker App
-   `$ `
-   `$ `

### Homebrew:

Homebrew is a popular package manager for macOS. It simplifies the installation and management of software packages on your Mac. Here are some key terms and concepts related to Homebrew:

-   `Package Manager`: A package manager is a software tool that automates the process of installing, updating, and managing software packages on a computer system. Homebrew is one such package manager for macOS.

-   `Formula`: In Homebrew, a formula is a Ruby script that describes how to install and configure a particular software package. Each formula corresponds to a specific software package that Homebrew can install.

-   `Package`: A package refers to a software application or library that you can install using Homebrew. Homebrew maintains a collection of packages, each represented by a formula.

-   `Tap`: A tap in Homebrew is a collection of additional formulae and/or other related content maintained separately from the main Homebrew repository. Taps allow users to access formulae that are not included in the core Homebrew repository.

-   `Homebrew Core`: Homebrew Core is the main repository of formulae maintained by the Homebrew project. It contains a wide range of popular software packages that can be installed using Homebrew.

-   `Cask`: Homebrew Cask is an extension of Homebrew that allows you to install macOS applications and binaries through the command line. It simplifies the installation of GUI-based software by automating the download and installation process.

-   `Cellar`: The Cellar is the directory where Homebrew installs software packages and their associated files. By default, the Cellar is located at /usr/local/Cellar.

-   `Brewfile`: A Brewfile is a text file that lists the packages you want Homebrew to install on your system. It allows you to define a set of packages and their versions, making it easier to reproduce the same software environment on multiple machines.

-   `Formulae and Casks`: Homebrew categorizes packages into two types: formulae and casks. Formulae are typically command-line tools or libraries, while casks are graphical applications.

-   `Installation and Usage`: To use Homebrew, you need to install it first. After installation, you can use the brew command to search for and install packages. The general usage syntax is brew <command> <package>. For example, brew install python installs the Python package.

-   `/usr/local/Cellar` is the directory where Homebrew stores the source code or binary files for command-line utilities and other software packages that it installs. This includes packages that are installed using the brew command, as well as some packages that are installed using Homebrew Cask, such as fonts or plugins for command-line tools.
-   `/usr/local/Caskroom`, on the other hand, is the directory where Homebrew Cask stores the binary applications that it installs. This includes popular desktop applications like web browsers, text editors, and media players.
-   []()

#### How to `search`/`install`/`run`/`use` and `stop` a service through Homebrew

-   `$ brew search postgres`
-   `$ brew install postgresql@14`
-   `$ brew services run/start postgresql`
-   `$ psql postgres`
-   `$ brew services stop/kill postgresql`

### [Automatically Backup Files to External Hard Drive on a Mac Using Automator](https://www.youtube.com/watch?v=n17XsI80ndE)

### [Restore MacOS to the Factory Setting](https://support.apple.com/en-us/HT208496)

1. You’re going to erase your startup disk, so the first thing you need to do is start up from the recovery partition. To do this, click  and choose Restart. When your Mac shuts off and then powers back on, press and hold `⌘ + R` keys until you see the Apple logo. Then release the keys and proceed to the next step.
2. Erase Data from Mac Hard Drive
   While in Recovery Mode, you won’t see your usual login screen. Instead, you’ll see the “macOS Utilities” window. Here are your next steps:

    a. In the macOS Utilities window, choose Disk Utility and click Continue.

    b. Choose your startup disk and click Erase.

    c. Choose Mac OS Extended (Journaled) as the format.

    d. Click Erase.

    e. Wait until the process is finished. When it’s done, go to the Disk Utility menu at the top and quit Disk Utility.

3. Reinstall macOS (optional)

Now, with your hard drive completely erased and free of any data, you can perform a clean install of macOS. You can do so while your Mac is still in recovery mode. From the same macOS Utilities window, choose Reinstall macOS (Reinstall OS X in older versions). Consider installing a new macOS Catalina. But doing so isn’t necessary. If you’re giving your Mac to someone else to enjoy, you may just leave it as is so that the new owner can set it up as they like. You’re done. Your Mac is fully prepared for its new owner. Don’t forget, you can use these instructions if you’re selling your Mac or if you want to erase your startup disk to reinstall macOS. If you plan on keeping your Mac, you might be interested in our guide on How to Make a Bootable High Sierra Installer.

### CRONTAB RELATED BASH COMMANDS:

-   `$ crontab -l` → list out your crontab.
-   `$ crontab -e` → edit your crontab.
-   `$ crontab -u user2 -e` → edit user2's crontab.
-   `$ sudo crontab -u Farzana -e` → Edit the cronjob for user Farzana
-   `$ sudo crontab -l` → List out root user's crontab.
-   `$ crontab -r` → all the cronjob

## Windows Shortcuts

-   `Alt + space + R` → Restore Down
-   `Alt + space + X` → Maximize
-   `Alt + space + N` → Minimization
-   `ALT+TAB` → Switch between open items
-   `MSKey+TAB` → Cycle through programs on the taskbar
-   `ALT+ESC` → Cycle through items in the order in which they were opened
-   `CTRL+SHIFT+ESC` → Open Task Manager
-   `NUMBER KEYS` → Launch From Quick Launch
-   `MSKey +D` OR `MSKey+M` → Maximization & Minimization
