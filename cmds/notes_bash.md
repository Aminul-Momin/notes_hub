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

### Elements of Bash:

-   [Pipeline](https://tiswww.case.edu/php/chet/bash/bashref.html#Pipelines):

    -   A pipeline is a sequence of one or more commands separated by one of the control operators `|` or `|&`

-   [Array in Bash](https://tiswww.case.edu/php/chet/bash/bashref.html#Arrays):

-   [Grouping Commands](https://ss64.com/bash/syntax-brackets.html):

-   [Shell Expansion](https://tiswww.case.edu/php/chet/bash/bashref.html#Shell-Expansions): Expansion is performed on the command line after it has been split into tokens. There are seven kinds of expansion performed:
    -   **Brace Expansion** $→$ Expansion of expressions within braces.
    -   **Tilde Expansion** $→$ Expansion of the ~ character.
    -   **Shell Parameter Expansion** $→$ How Bash expands variables to their values.
    -   **Command Substitution** $→$ Using the output of a command as an argument.
    -   **Arithmetic Expansion** $→$ How to use arithmetic in shell expansions.
    -   **Process Substitution** $→$ A way to write and read to and from a command.
    -   **Word Splitting** $→$ How the results of expansion are split into separate arguments.
    -   **Filename Expansion** $→$ A shorthand for specifying filenames matching patterns.

### Special Variables in Bash:

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

### Flags/Options in Bash:

-   [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html)
-   [Taking command line arguments using flags in bash](https://dev.to/shriaas2898/taking-command-line-arguments-using-flags-in-bash-121)
-   [Different ways to implement flags in bash](https://jonalmeida.com/posts/2013/05/26/different-ways-to-implement-flags-in-bash/)
-

### Functions in Bash:

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
