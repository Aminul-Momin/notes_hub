<h1 style="color:red" align="center" >LINUX SHELL:</h1>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Notes Link</summary>

-   [LinuxHowTo](https://www.linuxhowto.net/)
-   [[notes_bash]]
-   [[notes_linux]]
-   [The 50 Most Popular Linux & Terminal Commands - Full Course for Beginners](https://www.youtube.com/watch?v=ZtqBQ68cfJc&t=119s)
-   [18 Commands That Will Change The Way You Use Linux Forever](https://www.youtube.com/watch?v=AVXYq8aL47Q)
</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Terminology</summary>

-   COMMAND DESCRIPTION SYNTAX:

    1. angle brackets for required parameters:
        - EX: `ping <hostname>`
    2. square brackets for optional parameters:
        - EX: `mkdir [-p] <dirname>`
    3. ellipses for repeated items:
        - EX: `cp <source1> [source2…] <dest>`
    4. vertical bars for choice of items:
        - EX: `netstat {-t|-u}`

-   COMMAND-LINE ARGUMENT:

    -   A command-line argument or parameter is an item of information provided to a program when it is started. A program can have many command-line arguments that identify sources or destinations of information, or that alter the operation of the program.

-   COMMAND-LINE OPTION:

    -   A command-line option or simply option (also known as a flag or switch) modifies the operation of a command; the effect is determined by the command's program. Options follow the command name on the command line, separated by spaces. A space before the first option is not always required, such as Dir/? and DIR /? in DOS, which have the same effect[10] of listing the DIR command's available options, whereas dir --help (in many versions of Unix) does require the option to be preceded by at least one space (and is case-sensitive).

-   OPTION CONVENTIONS IN UNIX-LIKE SYSTEMS:

    -   In Unix-like systems, the ASCII hyphen-minus begins options; the new (and GNU) convention is to use two hyphens then a word (e.g. --create) to identify the option's use while the old convention (and still available as an option for frequently-used options) is to use one hyphen then one letter (e.g., -c); if one hyphen is followed by two or more letters it may mean two options are being specified, or it may mean the second and subsequent letters are a parameter (such as filename or date) for the first option.

-   TERMINAL VS. BASH VS. COMMAND LINE VS. PROMPT:
    https://www.youtube.com/watch?v=hMSByvFHOro

## </details>

### How to set default shell to bash.

-   `$ cat /etc/shells.`→ List out available shells.
-   `$ chsh -s /bin/bash`→ Change current Shell to bash shell on MacOS.
-   `$ usermod -s /bin/bash <username>`→ Set current shell to /bin/bash on RHEL.
-   `$ exec $SHELL -l`→ Reload your shell.
-   `$ `

### Important Directories in RHEL:

-   `$ cat /etc/redhat-release`
-   `$ cat /etc/passwd `
-   `$ cat /etc/sudoers`
-   `$ cat /etc/hosts`
-   `$ cat /etc/ssh/sshd_config` → SSH Clint Configuration File
-   `$ cat /etc/services`

<details open><summary style="text-align:left"><a style="font-size:15px;color:red;" href="https://www.ssh.com/academy/ssh/command#ssh-client-configuration-file">SSH: Usage, Options, Configuration</a></summary>
<!-- ### [SSH: Usage, Options, Configuration](https://www.ssh.com/academy/ssh/command#ssh-client-configuration-file) -->

-   [SSH Agent Explained](https://smallstep.com/blog/ssh-agent-explained/)
-   [Understanding the Difference Between ssh and sshd](https://www.secur.cc/what-is-the-difference-between-ssh-and-sshd/#:~:text=The%20main%20difference%20is%20that,server%20using%20the%20users%20credentials.)

-   SSH (Secure Shell or Secure Socket Shell): SSH is a network protocol that gives users, particularly system administrators, a secure way to access a computer over an unsecured network.
-   SSH Clint:
-   SSH Agent:

-   **ssh-keygen:**

    -   `$ ssh-keygen -t rsa -f ~/.ssh/<KEY_FILENAME> -C [USERNAME]` → Generate a rsa key with file-name `KEY_FILENAME` and username `USERNAME`.
    -   `$ ssh-keygen -t rsa -f ~/.ssh/<KEY_FILENAME> -P passphrase` → Example 1: `$ ssh-keygen -f ~/.ssh/file_name -t rsa -P ""`

-   **ssh-add:**

    -   `$ ssh-add ~/.ssh/id_rsa` → In order not to have prompted passphrase at login, cache the passphrase into 'ssh-agent' if you generate a key with passphrase.
    -   `alias sshadd='eval $(ssh-agent) && ssh-add'` → Create alias to cache passphrase since `ssh-add` is temporary for a shell session.
    -   `$ ssh-add -K ~/.ssh/id_rsa` → Add your SSH private key to the ssh-agent and store your passphrase in the keychain. The -K option is Apple's standard version of ssh-add, which stores the passphrase in your keychain for you when you add an ssh key to the ssh-agent. If you chose not to add a passphrase to your key, run the command without the -K option.
    -   `$ cat ~/.ssh/file_name.pub >> ~/.ssh/authorized_keys`
    -   `$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys`
    -   `$ pbcopy < ~/.ssh/id_rsa.pub` → Copies the contents of the id_rsa.pub file to your clipboard in MacOS

    **ssh:**

    -   `$ ssh user@host` → Connects to host as user
    -   `$ ssh -i .ssh/local_login_key.pub shah@10.0.0.4`
    -   `$ ssh shah@am2.local`
    -   `$ ssh farzana@am2.local`
    -   `$ ssh datanode1 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub`

-   **scp:**

    -   `$ scp -r /local/directory/ username@to_host:/remote/directory/` → Copy directory from local host to a remote hos SCP example
    -   `$ scp file.txt username@to_host:/remote/directory/` → Copy file from local host to a remote host

-   **ssh-copy-id:**

    -   `$ ssh-copy-id user@host` → Adds your ssh key to host for user to enable a keyed or passwordless login
        -   `$ ssh-copy-id shah@10.0.0.4`
        -   `$ ssh-copy-id shah@am2.local`

</details>

---

### rsync

```bash
rsync -avz \                        # run in archival and vervose mode
    --rsh="ssh -i ~/.ssh/id_rsa" \  # make sure id_rsa file generated and coppied id_rsa.pub into remote server
    user@remote_server:/src_path \
    target_path
```

---

### curl

-   [Using Curl and Telnet Command To Make HTTP Requests](https://www.youtube.com/watch?v=cn3u7-dP3S0)
-   [Telnet vs SSH Explained](https://www.youtube.com/watch?v=tZop-zjYkrU)
-   `$ curl -vvv localhost:8000` → Simple get request.
-   `$ curl -vvv http://www.google.com` → Simple get request.
-   `curl –data “text=Hello” https://myDomain.com/firstPage.jsp` → Simple post request
-   `$ curl -x  sampleproxy.com:8090 -U username:password -O http://testdomain.com/testfile.tar.gz`
-   `$ curl`
-   `$ curl`
-   `$ curl`
-   `$ telnet www.google.com 80`

```bash

```

### Archive

-   **wget:**

    -   🔥 `$ wget -P ~/Data http://file-to-download.csv` → download `file-to-download.csv `into `~/Data` directory ( '`-P` to prefix directory path)
    -   `$ wget -O my-file.csv ~/Data http://file-to-download.csv` → download 'file-to-download.csv' and save it as 'my-file.csv' instead of 'file-to-download.csv' into '~/Data'. (`-O` indicates Output)
    -   `$ wget --directory-prefix=~/Data --output-document=my-file.csv http://file-to-download.csv` →

-   [curl](https://www.hostinger.com/tutorials/curl-command-with-examples-linux/)
-   [tar](https://linuxhint.com/linux-tar-command/)

    -   `$ tar xvf ~/Data/file-to-untar.tar -C ~/Download` → Untar file-to-untar.tar and save it into '~/Download' directory
    -   `$ tar --list -f tar_file_name.tar.gz` →

-   [zip/unzip](https://www.hostinger.com/tutorials/how-to-unzip-files-linux/)

    -   `$ unzip ~/Data/filename.zip -d ~/Data` → To unzip a ZIP file to a different directory than the current one, use the -d switch
    -   `$ unzip -l *.whl` →
    -   `$ gzip <filename>` → Compresses files using gzip algorithm
    -   `$ gunzip <filename>` → Uncompresses files compressed by gzip
    -   `$ gzcat <filename>` → Lets you look at gzipped file without actually having to gunzip it

---

### File Permission

-   [chmod:](https://en.wikipedia.org/wiki/Chmod)

    -   File permission system: `r=4,w=2,x=1` first, second, and third place of 3-digits representation for **Woner**, **Group**, and **Public** respectively

    -   `sudo chmod 664 <file_or_dir_name>`

        -   gives read and write previlage to User and Group and only read previlage to public.

    -   `sudo chmod g+w <file_or_dir_name>`

        -   add (`+`) write (`w`) privilege to group (`g`)

    -   `sudo chmod +x <file_name>`

        -   makes the file_name executible.

    -   `$ chmod 1755 findReslts.sh`
        -   sets sticky bit, sets read, write, and execute permissions for owner, and sets read and execute permissions for group and others (this suggests that the script be retained in memory)
    -   `$ chmod 4755 setCtrls.sh`
        -   sets UID, sets read, write, and execute permissions for user, and sets read and execute permissions for Group and Others
    -   `$ chmod 2755 setCtrls.sh`
        -   sets GID, sets read, write, and execute permissions for user, and sets read and execute permissions for Group and Others
    -   🔥 `sudo chmod -R u+rwX,g-rwx,o-rx <file_or_dir_name>`
        -   Recursively adds (`+`) read (`r`), write (`w`), and special execution (`X`) permissions for user (`u`), and removes (`-`) read (`r`), write (`w`), and execution (`x`) permissions for Group (`g`), and removes (`-`) read (`r`) and execution (`x`) permissions for Others

-   [chown](https://linuxize.com/post/linux-chown-command/)
-   `$ chown [OPTIONS] USER[:GROUP] FILE(s)`

    -   EX: `$ sudo chown :group file`
    -   EX: `$ sudo chown :docker file1.txt`
        -   Change the group owner of file1.txt from linuxtechi to docker.

-   `$ chown -R www-data: /var/dir`

    -   Change the ownership of all files and subdirectories under the /var/dir directory to a new owner and group named www-data

-   `$ chown www-data: symlink1`
    -   Change the ownership of the file or directory the symlink points to
-   `$ chown -h www-data symlink1`

    -   Change the group ownership of the symlink itself, use the -h option.

-   [chgrp](https://linuxize.com/post/chgrp-command-in-linux/)
-   `$ chgrp [OPTIONS] GROUP FILE..`
    -   EX: `$ chgrp OPTION group_name /path/to/file_or_directory`
    -   The group_name attribute represents the new group name that the file or directory will acquire. Additionally, you can specify the GID (group ID) instead of the group name. In that case, you need to append the GID with a plus sign (+).
-   `$ chgrp -R www-data /var/www`

-   `$ chgrp www-data symlink1`
    -   If you try to change the group of the symbolic link symlink1 that points to /opt/file1, chgrp will change the ownership of the file or directory the symlink points to:
-   `$ chgrp -h www-data symlink1`
    -   To change the group ownership of the symlink itself, use the `-h` option
-   `$ chgrp -hR www-data /var/www`
    -   Change the group ownership recursively including symbolic links, pass the `-h` option

---

### Links

-   symbolic links (also known as “soft links” or “symlinks”): Refer to a symbolic path indicating the abstract location of another file.
-   hard links : Refer to the specific location of physical data.

-   `$ ln -s path/source_file_name.extn`
    -   Create a symlink from destination directory
-   `$ ln -s {absolute_path/source_filename} {absolute_path/symbolic_filename}`
    -   Create symbolic link from any directory.
    -

---

### Manging Users & Groups

-   `$ su user_name` → Switch/set/substitute user into the given user_name.
-   `$ su Farzana --login` → Log into a user Farzana's profile.
-   `$ sudo su -` → How to become sudo user in RHEL.
-   `$ useradd [OPTIONS] USERNAME`
-   `$ sudo useradd username`
-   `$ sudo passwd username` → To be able to log in as the newly created user, you need to set the user password.

```bash
sudo useradd \
    -m \                        # to create the user home directory as /home/username
    -d /path/username \         # If you want to create the user’s home directory in other location
    -u 1500 \                   # to create a user with a specific UID. (verify: `id -u username`)
    -g group_name \             # set the login group to (Verify: `id -gn username`)
    -G wheel,developers \       # You to specify a list of supplementary groups which the user will be a member of
    -s /usr/bin/bash \          # allows you to specify the new user’s login shell. (verify: `grep username /etc/passwd`)
    -c "Test User Account" \    # option allows you to add a short description for the new user. Typically the user’s full name or the contact information are added as a comment.
    username
```

-   `$ useradd -D` # To view the current default options for `useradd` (`/etc/default/useradd`)
-   `$ `
-   `$ `

### Netowrking

-   What the hell are a TCP and UDP ports?

    -   A port is nothing but a 16-bit number between 0 to 65535.
    -   For example, TCP port number 22 may be forwarded to the OpenSSH server. Therefore, 22 port number is a way to identify the sshd (OpenSSH server) process.

-   Port numbers
    -   The Well Known Ports are those from 0 through 1023.
    -   The Registered Ports are those from 1024 through 49151.
    -   The Dynamic and Private Ports are those from 49152 through 65535.
-   A registered port is a network port assigned by the Internet Assigned Numbers Authority (IANA) and stored in `/etc/services` file.

---

<details open><summary style="font-size:15px;color:red;">Systemd and Service Management</summary>

<details><summary style="font-size:15px;color:orange;">Terminology</summary>

-   **Systemd:**

    systemd is a software suite that provides an array of system components for Linux[6] operating systems. Its main aim is to unify service configuration and behavior across Linux distributions;[7] Its primary component is a "system and service manager"—an init system used to bootstrap user space and manage user processes. It also provides replacements for various daemons and utilities, including device management, login management, network connection management, and event logging.

-   **Core components and libraries**

    Following its integrated approach, systemd also provides replacements for various daemons and utilities, including the startup shell scripts, pm-utils, inetd, acpid, syslog, watchdog, cron and atd. systemd's core components include the following:

    -   `systemd` is a system and service manager for Linux operating systems.
    -   `systemctl` is a command to introspect and control the state of the systemd system and service manager. Not to be confused with sysctl.
    -   `systemd-analyze` may be used to determine system boot-up performance statistics and retrieve other state and tracing information from the system and service manager.

    Beside its primary purpose of providing a Linux init system, the systemd suite can provide additional functionality, including the following components:

    -   `journald`
        `systemd-journald` is a daemon responsible for event logging, with append-only binary files serving as its logfiles. The system administrator may choose whether to log system events with systemd-journald, syslog-ng or rsyslog. The potential for corruption of the binary format has led to much heated debate.
        Journalctl is a utility for querying and displaying logs from journald, systemd’s logging service. Since journald stores log data in a binary format instead of a plaintext format, journalctl is the standard way of reading log messages processed by journald.

-   **Configuration of systemd**

    -   systemd records initialization instructions for each daemon in a configuration file (referred to as a "unit file") that uses a declarative language, replacing the traditionally used per-daemon startup shell scripts. The syntax of the language is inspired by .ini files.
    -   Unit-file types include:
    -   .service
    -   .socket
    -   .device (automatically initiated by systemd)
    -   .mount
    -   .automount
    -   .swap
    -   .target
    -   .path
    -   .timer (which can be used as a cron-like job scheduler)
    -   .snapshot
    -   .slice (used to group and manage processes and resources)
    -   .scope (used to group worker processes, isn't intended to be configured via unit files[69])

</details>

**systemctl**

-   [How to Use Systemctl Utility in Linux](https://linuxhint.com/systemctl-utility-linux/)
-   `$ sudo systemctl list-units`
-   `$ sudo systemctl list-units --type=service`
-   `$ sudo systemctl list-units –state=inactive`
-   `$ sudo systemctl cat docker` → show the contents of the Docker unit
-   `$ sudo systemctl edit docker` → The command will launch the nano text editor, allowing you to edit the unit file specified.
-   `$ `
-   `$ `
-   `$ sudo systemctl status sshd`
-   `$ sudo systemctl start nginx`
-   `$ sudo systemctl stop nginx`
-   `$ sudo systemctl reload nginx` → Reloading a service works by stopping the worker processes, apply configuration changes and restart the worker processes. That does not shut down the actual service itself.
-   `$ sudo systemctl restart nginx` → restarting will shut down the service and the worker processes and restart them.
-   `$ sudo systemctl enable nginx`
-   `$ sudo systemctl enable nginx --now`
-   `$ sudo systemctl disable sshd`
-   `$ `
-   `$ `

**journalctl**

-   [Using journalctl](https://www.loggly.com/ultimate-guide/using-journalctl/)

-   `$ `
-   `$ journalctl --since "1 hour ago"`
-   `$ journalctl --since "2015-06-26 23:15:00" --until "2015-06-26 23:20:00"`
-   `$ journalctl -u nginx.service`
-   `$ journalctl -u mysql.service -f` → “follows” the mysql service log.
-   `$ journalctl -u apache2.service -r -o json-pretty` → The -o parameter enables us to format the output of journalctl query.
-   `$ `
-   `$ `
</details>

---

### SHORTCUTS and HISTORY

-   🔥 `$ CTRL+A` → Move to beginning of line
-   🔥 `$ CTRL+E` → Moves to end of line
-   🔥 `$ ALT+B` → Moves backward one word
-   🔥 `$ ALT+D` → Deletes next word
-   🔥 `$ ALT+F` → Moves forward one word
-   🔥 `$ history` → Shows command line history
-   🔥 `$ !!` → Repeats the last command
-   🔥 `$ !<n>` → Refers to command line 'n'
-   🔥 `$ !<string>` → Refers to command starting with 'string'
-   `$ CTRL+B` → Moves backward one character
-   `$ CTRL+C` → Halts the current command
-   `$ CTRL+D` → Deletes one character backward or logs out of current session, similar to exit
-   `$ CTRL+F` → Moves forward one character
-   `$ CTRL+G` → Aborts the current editing command and ring the terminal bell
-   `$ CTRL+H` → Deletes one character under cursor (same as DELETE)
-   `$ CTRL+J` → Same as RETURN
-   `$ CTRL+K` → Deletes (kill) forward to end of line
-   `$ CTRL+L` → Clears screen and redisplay the line
-   `$ CTRL+M` → Same as RETURN
-   `$ CTRL+N` → Next line in command history
-   `$ CTRL+O` → Same as RETURN, then displays next line in history file
-   `$ CTRL+P` → Previous line in command history
-   `$ CTRL+R` → Searches backward
-   `$ CTRL+S` → Searches forward
-   `$ CTRL+T` → Transposes two characters
-   `$ CTRL+U` → Kills backward from point to the beginning of line
-   `$ CTRL+V` → Makes the next character typed verbatim
-   `$ CTRL+W` → Kills the word behind the cursor
-   `$ CTRL+X` → Lists the possible filename completions of the current word
-   `$ CTRL+Y` → Retrieves (yank) last item killed
-   `$ CTRL+Z` → Stops the current command, resume with fg in the foreground or bg in the background
-   `$ ALT+H` → Deletes one character backward
-   `$ BACKSPACE` → Deletes one character backward
-   `$ DELETE` → Deletes one character under cursor
-   `$ exit` → Logs out of current shell session

---

### BASH BASICS

-   `$ env` → Displays all environment variables
-   `$ echo $SHELL` → Displays the shell you're using
-   `$ echo $BASH_VERSION` → Displays bash version
-   `$ unset VARIABLE_NAME` → Unset the given variabel - 'VARIABLE_NAME'
-   `$ bash` → If you want to use bash (type exit to go back to your previously opened shell)
-   `$ whereis bash` → Locates the binary, source and manual-page for a command
-   `$ which bash` → Finds out which program is executed as 'bash' (default: /bin/bash, can change across environments)
-   `$ whoami` → Returns your username
-   `$ passwd` → Lets you change your password
-   `$ clear` → Clears content on window (hide displayed lines)

---

### SYSTEM INFO & NETWORK COMMANDS

-   [34 Basic Linux Commands Every User Should Know](https://www.hostinger.com/tutorials/linux-commands)
-   `$ quota -v` → shows what your disk quota is
-   `$ date` → shows the current date and time
-   `$ cal` → shows the month's calendar
-   `$ uptime` → shows current uptime
-   `$ w` → displays who are online and what they are doing
-   `$ finger <user>` → displays information about user
-   `$ uname -a` → shows kernel information
-   `$ man <command>` → shows the manual for specified command
-   `$ df` → shows disk usage → Use df command to get a report on the system’s disk space usage, shown in percentage and KBs. If you want to see the report in megabytes, type `df -m`
-   `$ du <filename>` → shows the disk usage of the files and directories in filename (du -s give only a total)
-   `$ cat /proc/meminfo` → to Check Memory Use in Linux
-   `$ last <yourUsername>` → lists your last logins
-   `$ ps -u yourusername` → lists your processes
-   `$ kill <PID>` → kills the processes with the ID you gave
-   `$ killall <processname>` → kill all processes with the name
-   `$ top` → displays your currently active processes
-   `$ htop` → to Find Memory Load of Each Process
-   `$ lsof` → lists open files
-   `$ bg` → lists stopped or background jobs ; resume a stopped job in the background
-   `$ fg` → brings the most recent job in the foreground
-   `$ fg <job>` → brings job to the foreground
-   `$ ping <host>` → pings host and outputs results
-   `$ whois <domain>` → gets whois information for domain
-   `$ dig <domain>` → gets DNS information for domain
-   `$ dig -x <host>` → reverses lookup host
-   `$ id` → get information of the user (user id)
    → Output Example: uid=501(a.momin) gid=20(staff) groups=20(staff),12(everyone),61(localaccounts),79(\_appserverusr),80(admin),81(\_appserveradm),98(\_lpadmin),701(com.apple.sharepoint.group.1),702(com.apple.sharepoint.group.2),33(\_appstore),100(\_lpoperator),204(\_developer),250(\_analyticsusers),395(com.apple.access_ftp),398(com.apple.access_screensharing),399(com.apple.access_ssh-disabled),400(com.apple.access_remote_ae)

---

### FILE COMMANDS

| Bash Commands                       | What it Does                                                                                                                                                       |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `$ ls`                              | lists your files in current directory, `ls <dir>` to print files in a specific directory                                                                           |
| `$ ls -l`                           | lists your files in 'long format', which contains the exact size of the file, who owns the file and who has the right to look at it, and when it was last modified |
| `$ ls -a`                           | lists all files in 'long format', including hidden files (name beginning with '.')                                                                                 |
| `$ ln -s <filename> <link>`         | creates symbolic link to file                                                                                                                                      |
| `$ touch <filename>`                | creates or updates (edit) your file                                                                                                                                |
| `$ cat <filename>`                  | prints file raw content (will not be interpreted)                                                                                                                  |
| `$ any_command > <filename>`        | '>' is used to perform redirections, it will set any_command's stdout to file instead of "real stdout" (generally /dev/stdout)                                     |
| `$ more <filename>`                 | shows the first part of a file (move with space and type q to quit)                                                                                                |
| `$ head <filename>`                 | outputs the first lines of file (default: 10 lines)                                                                                                                |
| `$ tail <filename>`                 | outputs the last lines of file (useful with -f option) (default: 10 lines)                                                                                         |
| `$ vim <filename>`                  | opens a file in VIM (VI iMproved) text editor, will create it if it doesn't exist                                                                                  |
| `$ mv <filename1> <dest>`           | moves a file to destination, behavior will change based on 'dest' type (dir: file is placed into dir; file: file will replace dest (tip: useful for renaming))     |
| `$ cp <filename1> <dest>`           | copies a file                                                                                                                                                      |
| `$ rm <filename>`                   | removes a file                                                                                                                                                     |
| `$ rm -fr ~/Desktop/{val,tst,tra*}` | Remove valid, test, train, and flower\* directories from ~/Desktop directory                                                                                       |
| `$ find . -name <name> <type>`      | searches for a file or a directory in the current directory and all its sub-directories by its name                                                                |
| `$ find . -type d -name .venv`      | Search in current directory for a directory whose name is `.venv`                                                                                                  |
| `$ diff <filename1> <filename2>`    | compares files, and shows where they differ                                                                                                                        |
| `$ wc <filename>`                   | tells you how many lines, words and characters there are in a file. Use -lwc (lines, word, character) to ouput only 1 of those informations                        |
| `$ sort <filename>`                 | sorts the contents of a text file line by line in alphabetical order, use -n for numeric sort and -r for reversing order.                                          |
| `$ sort -t -k <filename>`           | sorts the contents on specific sort key field starting from 1, using the field separator t.                                                                        |
| `$ chmod -options <filename>`       | lets you change the read, write, and execute permissions on your files (more infos: SUID, GUID)                                                                    |
| `$ gzip <filename>`                 | compresses files using gzip algorithm                                                                                                                              |
| `$ gunzip <filename>`               | uncompresses files compressed by gzip                                                                                                                              |
| `$ gzcat <filename>`                | lets you look at gzipped file without actually having to gunzip it                                                                                                 |
| `$ lpr <filename>`                  | prints the file                                                                                                                                                    |
| `$ lpq`                             | checks out the printer queue                                                                                                                                       |
| `$ lprm <jobnumber>`                | removes something from the printer queue                                                                                                                           |
| `$ genscript`                       | converts plain text files into postscript for printing and gives you some options for formatting                                                                   |
| `$ dvips <filename>`                | prints .dvi files (i.e. files produced by LaTeX)                                                                                                                   |
| `$ grep <pattern> <filenames>`      | looks for the string in the files                                                                                                                                  |
| `$ grep -r <pattern> <dir>`         | search recursively for pattern in directory                                                                                                                        |
| `$ head -n file_name \| tail +n`    | Print nth line from file.                                                                                                                                          |
| `$ head -y lines.txt \| tail +x`    | want to display all the lines from x to y. This includes the xth and yth lines.                                                                                    |

---

### DIRECTORY COMMANDS

-   `$ mkdir <dirname>` → Makes a new directory
-   `$ rmdir <dirname>` → Remove an empty directory
-   `$ rmdir -rf <dirname>` → Remove a non-empty directory
-   `$ mv <dir1> <dir2>` → Rename a directory from <dir1> to <dir2>
-   `$ cd <dirname>` → Changes directory
-   `$ cp -r <dir1> <dir2>` → Copy <dir1> into <dir2> including sub-directories
-   `$ pwd` → Tells you where you currently are
-   `$ cd` → Changes to home directory.
-   `$ cd ..` → Changes to the parent directory.
-   `$ cd ~` → Changes to home directory.
-   `$ cd -` → Changes to previous directory.

---

### COMMAND-LINE PROCESSING CYCLE

---

The default order for command lookup is functions, followed by built-ins, with scripts and executables last.
There are three built-ins that you can use to override this order: `command`, `builtin` and `enable`.

---

-   command # removes alias and function lookup. Only built-ins and commands found in the search path are executed
-   builtin # looks up only built-in commands, ignoring functions and commands found in PATH
-   enable # enables and disables shell built-ins

-   eval # takes arguments and run them through the command-line processing steps all over again

---

### INPUT/OUTPUT REDIRECTORS

| Expression   | What it Does                                                            |
| ------------ | ----------------------------------------------------------------------- |
| `cmd1\|cmd2` | pipe; takes standard output of cmd1 as standard input to cmd2           |
| `< file`     | takes standard input from file                                          |
| `> file`     | directs standard output to file                                         |
| `>> file`    | directs standard output to file; append to file if it already exists    |
| `>\| file`   | forces standard output to file even if noclobber is set                 |
| `n>\| file`  | forces output to file from file descriptor n even if noclobber is set   |
| `<> file`    | uses file as both standard input and standard output                    |
| `n <> file`  | uses file as both input and output for file descriptor n                |
| `n > file`   | directs file descriptor n to file                                       |
| `n < file`   | takes file descriptor n from file                                       |
| `n >> file`  | directs file description n to file; append to file if it already exists |
| `n>&`        | duplicates standard output to file descriptor n                         |
| `n<&`        | duplicates standard input from file descriptor n                        |
| `n>&`m       | file descriptor n is made to be a copy of the output file descriptor    |
| `n<&`m       | file descriptor n is made to be a copy of the input file descriptor     |
| `&>file`     | directs standard output and standard error to file                      |
| `<&-`        | closes the standard input                                               |
| `>&-`        | closes the standard output                                              |
| `n>&-`       | closes the ouput from file descriptor n                                 |
| `n<&-`       | closes the input from file descripor n                                  |

---

### PROCESS HANDLING

-   To suspend a job, type `CTRL+Z` while it is running. You can also suspend a job with `CTRL+Y`.
-   This is slightly different from `CTRL+Z` in that the process is only stopped when it attempts to read input from terminal.
-   Of course, to interrupt a job, type `CTRL+C`.

| myCommand &          | runs job in the background and prompts back the shell                                                 |
| :------------------- | :---------------------------------------------------------------------------------------------------- |
| jobs                 | lists all jobs (use with -l to see associated PID)                                                    |
| fg                   | brings a background job into the foreground                                                           |
| fg %+                | brings most recently invoked background job                                                           |
| fg %-                | brings second most recently invoked background job                                                    |
| fg %N                | brings job number N                                                                                   |
| fg %string           | brings job whose command begins with string                                                           |
| fg %?string          | brings job whose command contains string                                                              |
| kill -l              | returns a list of all signals on the system, by name and number                                       |
| kill PID             | terminates process with specified PID                                                                 |
| kill -s SIGKILL 4500 | sends a signal to force or terminate the process                                                      |
| kill -15 913         | Ending PID 913 process with signal 15 (TERM)                                                          |
| kill %1              | Where %1 is the number of job as read from 'jobs' command.                                            |
| ps                   | prints a line of information about the current running login shell and any processes running under it |
| ps -a                | selects all processes with a tty except session leaders                                               |
| trap cmd sig1 sig2   | executes a command when a signal is received by the script                                            |
| trap "" sig1 sig2    | ignores that signals                                                                                  |
| trap - sig1 sig2     | resets the action taken when the signal is received to the default                                    |
| disown <PID \| JID>  | removes the process from the list of jobs                                                             |
| wait                 | waits until all background jobs have finished                                                         |

---

### TIPS & TRICKS

```bash
# set an alias
cd; nano .bash_profile
> alias gentlenode='ssh admin@gentlenode.com -p 3404'  # add your alias in .bash_profile

# to quickly go to a specific directory
cd; nano .bashrc
> shopt -s cdable_vars
> export websites="/Users/mac/Documents/websites"

source .bashrc
cd $websites
```

---

### DEBUGGING SHELL PROGRAMS

```bash
bash -n scriptname  # don't run commands; check for syntax errors only
set -o noexec       # alternative (set option in script)

bash -v scriptname  # echo commands before running them
set -o verbose      # alternative (set option in script)

bash -x scriptname  # echo commands after command-line processing
set -o xtrace       # alternative (set option in script)

trap 'echo $varname' EXIT  # useful when you want to print out the values of variables at the point that your script exits

function errtrap {
    es=$?
    echo "ERROR line $1: Command exited with status $es."
}

trap 'errtrap $LINENO' ERR  # is run whenever a command in the surrounding script or function exits with non-zero status

function dbgtrap {
    echo "badvar is $badvar"
}

trap dbgtrap DEBUG  # causes the trap code to be executed before every statement in a function or script
# ...section of code in which the problem occurs...
trap - DEBUG  # turn off the DEBUG trap

function returntrap {
    echo "A return occurred"
}

trap returntrap RETURN  # is executed each time a shell function or a script executed with the . or source commands finishes executing
```

---

<!-- <h1 style="color:red" align="center" >BASH PROGRAMMING:</h1> -->

<details>

<summary style="font-size:25px;color:Orange;text-align:center">BASH PROGRAMMING</summary>
<details>

<summary style="font-size:25px;color:red;">Terminology</summary>

### Bash Tutorials:

-   [[Notes_shell]]
-   [Bash Cheatsheet](https://devhints.io/bash)
-   [The Complete How To Guide Of Bash Functions](https://www.shell-tips.com/bash/functions/)
-   [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
-   [Interview Bit](https://www.interviewbit.com/shell-scripting-interview-questions/)
-   [Interview Questions](https://www.guru99.com/shell-scripting-interview-questions.html)

### The Linux Kernel

Every operating system (OS) has a kernel. The kernel is the layer of the OS that bridges the hardware with the main programs that run on a computer. The kernel is the core of the OS and is the first to load when the computer boots up. It remains in the computer's memory throughout a session. It is responsible for providing an interface for all applications, controlling the hardware and allowing processes to get information from each other. There are three types of kernel:

-   Microkernel
-   Hybrid
-   Monolithic

Linux uses a monolithic kernel, so called because it includes device drivers and the file management system and therefore requires more memory. On the opposite end of the spectrum, a microkernel aims to occupy the smallest amount of memory by managing only the necessities such as the CPU, memory and inter-process communication (IPC).

### The Shell

The shell forms the layer between the user and the kernel so the user can enter commands. The kernel 'understands' only binary language, which is composed exclusively of ones and zeros. In early computing, any instructions/commands from the users were entered in binary language, but this evolved so that the user can enter commands in a more recognizable language. It is the shell that acts as the go-between, accepting the commands entered in the language recognizable by the user, and translating them to binary language for the kernel.

### Bash

Bash stands for Bourne Again SHell, and is **a type of shell** found in Linux, which is the default shell in several versions ('distributions') of Linux. Other common types of shell are cshell and kshell, though there are others. The most primitive type of shell in Linux is sh.

### Terminal

The terminal is the application that brings it all together, in the sense that it provides a visual representation of the shell for the user to enter commands. In other words, in a GUI (graphical user interface), where applications and other features are visually represented by images that the user can manipulate by clicking on them with a cursor, a terminal application opens a window where the user can type in commands for the shell to interpret into binary language for the kernel.

Summing it all up, we could say that we've discussed three layers so far: the terminal, where the user enters written commands; the shell, and Bash being a type of shell, which takes those commands and interprets them into binary language; the kernel which takes the binary language commands and executes the task on hand.

</details>

### Elements of Bash:

-   [Pipeline](https://tiswww.case.edu/php/chet/bash/bashref.html#Pipelines):

    -   A pipeline is a sequence of one or more commands separated by one of the control operators `|` or `|&`

-   [Array in Bash](https://tiswww.case.edu/php/chet/bash/bashref.html#Arrays):

-   [Grouping Commands](https://ss64.com/bash/syntax-brackets.html):

-   [Shell Expansion](https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Expansions): Expansion is performed on the command line after it has been split into tokens. There are seven kinds of expansion performed:
    -   **Brace Expansion** $→$ Expansion of expressions within braces.
    -   **Tilde Expansion** $→$ Expansion of the ~ character.
    -   [Shell Parameter Expansion](https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Parameter-Expansion) $→$ How Bash expands variables to their values.
    -   **Command Substitution** $→$ Using the output of a command as an argument.
    -   **Arithmetic Expansion** $→$ How to use arithmetic in shell expansions.
    -   **Process Substitution** $→$ A way to write and read to and from a command.
    -   **Word Splitting** $→$ How the results of expansion are split into separate arguments.
    -   **Filename Expansion** $→$ A shorthand for specifying filenames matching patterns.

### Flags/Options in Bash:

-   [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html)
-   [Taking command line arguments using flags in bash](https://dev.to/shriaas2898/taking-command-line-arguments-using-flags-in-bash-121)
-   [Different ways to implement flags in bash](https://jonalmeida.com/posts/2013/05/26/different-ways-to-implement-flags-in-bash/)
-

### Special Variables in Bash:

-   [Shell Parameters](https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Parameters)

-   `$0` $→$ The filename of the current script.
-   `$n` $→$ The Nth argument passed to script was invoked or function was called.
-   `$#` $→$ The number of argument passed to script or function.
-   `$@` $→$ All arguments passed to script or function.
-   `$*` $→$ All arguments passed to script or function.
-   `$?` $→$ The exit status of the last command executed.
-   `$$` $→$ The process ID of the current shell. For shell scripts, this is the process ID under which they are executing.
-   `$!` $→$ The process number of the last background command.
-   `$IFS`$→$

### Shell command separator/control characters:

| Bash Widgets      | Meaning                                                                                                                                                                                                                                                                                                                                                                                  |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `$(command)`      | Replace command with its output. Example: `my_var = $(ls -1)`; `ls -l $(which cp)`                                                                                                                                                                                                                                                                                                       |
| `$((mth-exprsn))` | Example: ` my_var = $(( 2 + 8))` `echo $(($((5**2)) * 3))`                                                                                                                                                                                                                                                                                                                               |
| `$`               | prefix to a variable, like `"$myvar"`                                                                                                                                                                                                                                                                                                                                                    |
| `$1`              | First argument supplied after the program/function on execution.                                                                                                                                                                                                                                                                                                                         |
| `$2`              | Second argument supplied after the program/function on execution. ($3 etc.)                                                                                                                                                                                                                                                                                                              |
| `$#`              | Shows the number of arguments.                                                                                                                                                                                                                                                                                                                                                           |
| `$?`              | Any argument (good to use in `if` statements)                                                                                                                                                                                                                                                                                                                                            |
| `$*`              | All arguments                                                                                                                                                                                                                                                                                                                                                                            |
| `$@`              | All arguments                                                                                                                                                                                                                                                                                                                                                                            |
| `#`               | commented line, anything on a line after "#" will be overlooked by the script                                                                                                                                                                                                                                                                                                            |
| `0>`              | stdin stream director (I never seen this used in any script)                                                                                                                                                                                                                                                                                                                             |
| `1>`              | stdout stream director (standard output)                                                                                                                                                                                                                                                                                                                                                 |
| `2>`              | stderr stream director (standard error output)                                                                                                                                                                                                                                                                                                                                           |
| `%`               | job character, %1 = fg job 1, %2 = fg job 2, etc.                                                                                                                                                                                                                                                                                                                                        |
| `>>`              | stream director append to a file                                                                                                                                                                                                                                                                                                                                                         |
| `<<`              | stdin stream director. (`cat > file << EOF` ; anything ; EOF)                                                                                                                                                                                                                                                                                                                            |
| `>`               | stream director that will start at the top of the file (in if statements `< `and `>` may be used as greater-then and lesser-then, as: `if [ "$1" >= "2" ]`) = back-slash, takes away any special meaning with a character, `$var` will not be treated as a variable. (and a new line will not be treated as a new line) Also a before a command, removes any alias on the command as: rm |
| `>&`              | stream director to stream director, ie. `echo "a" 1>/dev/null 2>&1` this directs `2>` to the same place as `1>`                                                                                                                                                                                                                                                                          |
| `!$`              | last commands last argument                                                                                                                                                                                                                                                                                                                                                              |
| `!!`              | repeat last command                                                                                                                                                                                                                                                                                                                                                                      |
| `;`               | will separate 2 commands as if they were written on separate command lines                                                                                                                                                                                                                                                                                                               |
| `;;`              | end of a case function in a case statement. (see `case` further down)                                                                                                                                                                                                                                                                                                                    |
| `$!`              | PID of the last child process.                                                                                                                                                                                                                                                                                                                                                           |
| `$$`              | PID of current process (PID == Process ID)                                                                                                                                                                                                                                                                                                                                               |
| `$0`              | Shows program that owns the current process.                                                                                                                                                                                                                                                                                                                                             |
| `$-`              | current option flags (I never ever had to use this one)                                                                                                                                                                                                                                                                                                                                  |
| `$_`              | Last argument/Command                                                                                                                                                                                                                                                                                                                                                                    |
| `@`               | `$@` is equivalent to `"$1"` `"$2"` etc. (all arguments)                                                                                                                                                                                                                                                                                                                                 |
| `\`               | Escape special character interpretor                                                                                                                                                                                                                                                                                                                                                     |
| `' '`             | Interpret literally without evaluating any metacharacter.                                                                                                                                                                                                                                                                                                                                |
| `" "`             | Interpret literally with evaluating metacharacters.                                                                                                                                                                                                                                                                                                                                      |
| `*`               | wild card (`\*` can substitute any number of characters)                                                                                                                                                                                                                                                                                                                                 |
| `?`               | wild card (`? `can substitute any single character)                                                                                                                                                                                                                                                                                                                                      |
| `{#varname}`      | returns the length of the value of the variable as a character string                                                                                                                                                                                                                                                                                                                    |
| `*(patternlist)`  | matches zero or more occurrences of the given patterns                                                                                                                                                                                                                                                                                                                                   |
| `+(patternlist)`  | matches one or more occurrences of the given patterns                                                                                                                                                                                                                                                                                                                                    |
| `?(patternlist)`  | matches zero or one occurrence of the given patterns                                                                                                                                                                                                                                                                                                                                     |
| `@(patternlist)`  | matches exactly one of the given patterns                                                                                                                                                                                                                                                                                                                                                |
| `!(patternlist)`  | matches anything except one of the given patterns                                                                                                                                                                                                                                                                                                                                        |
| `(UNIX command)`  | command substitution: runs the command and returns standard output                                                                                                                                                                                                                                                                                                                       |

### VARIABLES

varname=value # defines a variable
varname=value command # defines a variable to be in the environment of a particular subprocess
echo $varname                # checks a variable's value
echo $$ # prints process ID of the current shell
echo $! # prints process ID of the most recently invoked background job
echo $? # displays the exit status of the last command
read <varname> # reads a string from the input and assigns it to a variable
let <varname> = <equation> # performs mathematical calculation using operators like +, -, \*, /, %
export VARNAME=value # defines an environment variable (will be available in subprocesses)

array[0]=valA # how to define an array
array[1]=valB
array[2]=valC
array=([2]=valC [0]=valA [1]=valB) # another way
array=(valA valB valC) # and another

${array[i]}                  # displays array's value for this index. If no index is supplied, array element 0 is assumed
${#array[i]} # to find out the length of any element in the array
${#array[@]} # to find out how many values there are in the array

declare -a # the variables are treated as arrays
declare -f # uses function names only
declare -F # displays function names without definitions
declare -i # the variables are treated as integers
declare -r # makes the variables read-only
declare -x # marks the variables for export via the environment

${varname:-word}             # if varname exists and isn't null, return its value; otherwise return word
${varname:=word} # if varname exists and isn't null, return its value; otherwise set it word and then return its value
${varname:?message}          # if varname exists and isn't null, return its value; otherwise print varname, followed by message and abort the current command or script
${varname:+word} # if varname exists and isn't null, return word; otherwise return null
${varname:offset:length} # performs substring expansion. It returns the substring of $varname starting at offset and up to length characters

${variable#pattern}          # if the pattern matches the beginning of the variable's value, delete the shortest part that matches and return the rest
${variable##pattern} # if the pattern matches the beginning of the variable's value, delete the longest part that matches and return the rest
${variable%pattern}          # if the pattern matches the end of the variable's value, delete the shortest part that matches and return the rest
${variable%%pattern} # if the pattern matches the end of the variable's value, delete the longest part that matches and return the rest
${variable/pattern/string}   # the longest match to pattern in variable is replaced by string. Only the first match is replaced
${variable//pattern/string} # the longest match to pattern in variable is replaced by string. All matches are replaced

${#varname} # returns the length of the value of the variable as a character string

\*(patternlist) # matches zero or more occurrences of the given patterns
+(patternlist) # matches one or more occurrences of the given patterns
?(patternlist) # matches zero or one occurrence of the given patterns
@(patternlist) # matches exactly one of the given patterns
!(patternlist) # matches anything except one of the given patterns

$(UNIX command) # command substitution: runs the command and returns standard output

---

# STRINGS EXPRESSION:

-   `str1 == str2`
    -   str1 matches str2
-   `str1 != str2`
    -   str1 does not match str2
-   `str1 < str2`
    -   str1 is less than str2 (alphabetically)
-   `str1 > str2`
    -   str1 is greater than str2 (alphabetically)
-   `str1 \> str2`
    -   str1 is sorted after str2
-   `str1 \< str2`
    -   str1 is sorted before str2
-   `-n str1`
    -   str1 is not null (has length greater than 0)
-   `-z str1`
    -   str1 is null (has length 0)

# FILES EXPRESSION:

-   `-a File`
    -   file exists or its compilation is successful
-   `-d File`
    -   file exists and is a directory
-   `-e File`
    -   file exists; same -a
-   `-f File`
    -   file exists and is a regular file (i.e., not a directory or other special type of file)
-   `-h File`
    -   True if the File exist and a symbolic link
-   `-r File`
    -   you have read permission
-   `-s File`
    -   file exists and is not empty
-   `-w File`
    -   your have write permission
-   `-x File`
    -   you have execute permission on file, or directory search permission if it is a directory
-   `-n var`
    -   True is the length of the var is greater than zero
-   `-z var`
    -   True if the var is empty
-   `-N File`
    -   file was modified since it was last read
-   `-O File`
    -   you own file
-   `-G File`
    -   file's group ID matches yours (or one of yours, if you are in multiple groups)
-   `file1 -nt file2File`
    -   file1 is newer than file2
-   `file1 -ot file2File`
    -   file1 is older than file2

# NUMBERS EXPRESSION:

-lt # less than
-le # less than or equal
-eq # equal
-ge # greater than or equal
-gt # greater than
-ne # not equal

### Functions in Bash:

### FUNCTIONS

```bash
# The function refers to passed arguments by position (as if they were positional parameters), that is, $1, $2, and so forth.
# $@ is equal to "$1" "$2"... "$N", where N is the number of positional parameters. $# holds the number of positional parameters.


function functname() {
    shell commands
}

unset -f functname  # deletes a function definition
declare -f          # displays all defined functions in your login session
```

---

### FLOW CONTROLS

statement1 && statement2 # and operator
statement1 || statement2 # or operator

-a # and operator inside a test conditional expression
-o # or operator inside a test conditional expression

### Some Discovered Errors:

```bash
# Brace Expension errors !
PATHS="$SD"/WORKSPACE_SETUP/.{git-aliases.bash,git-completion.bash,git-prompt.sh}

# Error
PATHS="$SD/WORKSPACE_SETUP.git-aliases.bash $SD/WORKSPACE_SETUP.git-completion.bash $SD/WORKSPACE_SETUP.git-prompt.sh"

```

### Control Flow in Bash:

-   **Remarks:**

    -   contition is written in square brackets.
    -   when use mathematical operator in conditions or elsewhere use double parenthesis.

```bash
if [ expr1 ]; then
    statments ...
elif [ expr2 ]; then
    statments ...
elif [ expr3 ]; then
    statments ...
else
    statments ...
fi


if [ ! -f "$2" ]
then
  echo "File \"$2\" does not exist."
  exit $E_NOFILE
fi
```

### Looping in Bash:

-   **Remarks:**

#### for:

##### Operating on a file list contained in a variable

```bash

#!/bin/bash
# fileinfo.sh

FILES="/usr/sbin/accept
/usr/sbin/pwck
/usr/sbin/chroot
/usr/bin/fakefile
/sbin/badblocks
/sbin/ypbind"     # List of files you are curious about.
                  # Threw in a dummy file, /usr/bin/fakefile.

echo

for file in $FILES
do

  if [ ! -e "$file" ]       # Check if file exists.
  then
    echo "$file does not exist."; echo
    continue                # On to next.
   fi

  ls -l $file | awk '{ print $8 "         file size: " $5 }'  # Print 2 fields.
  whatis `basename $file`   # File info.
  # Note that the whatis database needs to have been set up for this to work.
  # To do this, as root run /usr/bin/makewhatis.
  echo
done

exit 0


```

##### Find a particular string in the binaries in a specified directory.

```bash
#!/bin/bash
# findstring.sh:

directory=/usr/bin/
fstring="Free Software Foundation"  # See which files come from the FSF.

for file in $( find $directory -type f -name '*' | sort )
do
  strings -f $file | grep "$fstring" | sed -e "s%$directory%%"
  #  In the "sed" expression,
  #+ it is necessary to substitute for the normal "/" delimiter
  #+ because "/" happens to be one of the characters filtered out.
  #  Failure to do so gives an error message. (Try it.)
done

exit $?

#  Exercise (easy):
#  ---------------
#  Convert this script to take command-line parameters
#+ for $directory and $fstring.
```

##### Symbolic links in a directory, saved to a file

```bash

#!/bin/bash
# symlinks.sh: Lists symbolic links in a directory.

OUTFILE=symlinks.list                         # save-file

directory=${1-`pwd`}
#  Defaults to current working directory,
#+ if not otherwise specified.


echo "symbolic links in directory \"$directory\"" > "$OUTFILE"
echo "---------------------------" >> "$OUTFILE"

for file in "$( find $directory -type l )"    # -type l = symbolic links
do
  echo "$file"
done | sort >> "$OUTFILE"                     # stdout of loop
#           ^^^^^^^^^^^^^                       redirected to save file.

# echo "Output file = $OUTFILE"

exit $?
```

##### Nested Loop

```bash

#!/bin/bash
# nested-loop.sh: Nested "for" loops.

outer=1             # Set outer loop counter.

# Beginning of outer loop.
for a in 1 2 3 4 5
do
  echo "Pass $outer in outer loop."
  echo "---------------------"
  inner=1           # Reset inner loop counter.

  # ===============================================
  # Beginning of inner loop.
  for b in 1 2 3 4 5
  do
    echo "Pass $inner in inner loop."
    let "inner+=1"  # Increment inner loop counter.
  done
  # End of inner loop.
  # ===============================================

  let "outer+=1"    # Increment outer loop counter.
  echo              # Space between output blocks in pass of outer loop.
done
# End of outer loop.

exit 0
```

```bash
# Process each file in directory_1, comparing it to directory_2
missing=0
for filename in "$1"/*; do
    fn=$(basename "$filename")
    if [ -f "$filename" ]; then
        if [ ! -f "$2/$fn" ]; then
            echo "$fn is missing from $2"
            missing=$((missing + 1))
        fi
    fi
done
echo "$missing files missing"
```

##### Various ways of geting list of files's path

```bash
for entry in `ls $search_dir`; do
    echo $entry
done

for entry in "$search_dir"/* "$work_dir"/*
do
  if [ -f "$entry" ];then
    echo "$entry"
  fi
done

$ pwd
/home/victoria

$ find $(pwd) -maxdepth 1 -type f -not -path '*/\.*' | sort
/home/victoria/new
/home/victoria/new1
/home/victoria/new2
/home/victoria/new3
/home/victoria/new3.md
/home/victoria/new.md
/home/victoria/package.json
/home/victoria/Untitled Document 1
/home/victoria/Untitled Document 2

$ find . -maxdepth 1 -type f -not -path '*/\.*' | sed 's/^\.\///g' | sort
new
new1
new2
new3
new3.md
new.md
package.json
Untitled Document 1
Untitled Document 2
```

-   `.` : current folder
-   remove `-maxdepth 1` to search recursively
-   `-type f `: find files, not directories (`d`)
-   `-not -path '*/\.*'` : do not return `.hidden_files`
-   `sed 's/^\.\///g'` : remove the prepended `./` from the result list

#### while:

##### While loop with multiple conditions

```bash
var1=unset
previous=$var1

while echo "previous-variable = $previous"
      echo
      previous=$var1
      [ "$var1" != end ] # Keeps track of what $var1 was previously.
      # Four conditions on *while*, but only the final one controls loop.
      # The *last* exit status is the one that counts.
do
echo "Input variable #1 (end to exit) "
  read var1
  echo "variable #1 = $var1"
done

# Try to figure out how this all works.
# It's a wee bit tricky.

exit 0
```

##### Inside its test brackets, a while loop can call a function.

```bash
t=0

condition ()
{
  ((t++))

  if [ $t -lt 5 ]
  then
    return 0  # true
  else
    return 1  # false
  fi
}

while condition
#     ^^^^^^^^^
#     Function call -- four loop iterations.
do
  echo "Still going: t = $t"
done

# Still going: t = 1
# Still going: t = 2
# Still going: t = 3
# Still going: t = 4
```

```bash
number=0
while [ "$number" -lt 10 ]; do
    echo "Number = $number"
    number=$((number + 1))
done
```

### COLORS AND BACKGROUNDS

        # Reset
        Color_Off='\033[0m' # Text Reset

        # Regular Colors
        Black='\033[0;30m'  # Black
        Red='\033[0;31m'    # Red
        Green='\033[0;32m'  # Green
        Yellow='\033[0;33m' # Yellow
        Blue='\033[0;34m'   # Blue
        Purple='\033[0;35m' # Purple
        Cyan='\033[0;36m'   # Cyan
        White='\033[0;97m'  # White

        # Additional colors
        LGrey='\033[0;37m'  # Ligth Gray
        DGrey='\033[0;90m'  # Dark Gray
        LRed='\033[0;91m'   # Ligth Red
        LGreen='\033[0;92m' # Ligth Green
        LYellow='\033[0;93m'# Ligth Yellow
        LBlue='\033[0;94m'  # Ligth Blue
        LPurple='\033[0;95m'# Light Purple
        LCyan='\033[0;96m'  # Ligth Cyan


        # Bold
        BBlack='\033[1;30m' # Black
        BRed='\033[1;31m'   # Red
        BGreen='\033[1;32m' # Green
        BYellow='\033[1;33m'# Yellow
        BBlue='\033[1;34m'  # Blue
        BPurple='\033[1;35m'# Purple
        BCyan='\033[1;36m'  # Cyan
        BWhite='\033[1;37m' # White

        # Underline
        UBlack='\033[4;30m' # Black
        URed='\033[4;31m'   # Red
        UGreen='\033[4;32m' # Green
        UYellow='\033[4;33m'# Yellow
        UBlue='\033[4;34m'  # Blue
        UPurple='\033[4;35m'# Purple
        UCyan='\033[4;36m'  # Cyan
        UWhite='\033[4;37m' # White

        # Background
        On_Black='\033[40m' # Black
        On_Red='\033[41m'   # Red
        On_Green='\033[42m' # Green
        On_Yellow='\033[43m'# Yellow
        On_Blue='\033[44m'  # Blue
        On_Purple='\033[45m'# Purple
        On_Cyan='\033[46m'  # Cyan
        On_White='\033[47m' # White

        # Example of usage
        echo -e "${Green}This is GREEN text${Color_Off} and normal text"
        echo -e "${Red}${On_White}This is Red test on White background${Color_Off}"
        # option -e is mandatory, it enable interpretation of backslash escapes

</details>
