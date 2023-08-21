<details>
<summary style="font-size:25px;color:Orange;text-align:left">Git Terminology</summary>

🔥 GIT TUTORIALS:

-   [Learn Git with Bitbucket Cloud](https://www.atlassian.com/git/tutorials/learn-git-with-bitbucket-cloud)
-   [Udacity: How to Use Git and GitHub](https://www.youtube.com/playlist?list=PLAwxTw4SYaPk8_-6IGxJtD3i2QAu5_s_p)
-   https://git-scm.com/docs

🔥 KEY WORDS:

-   Checkout
    -   Checkout: Switching between different commit, branches or tags.
    -   Checkout a Branch means changing Head Pointer from current branch to the branch to be checkedout.
-   Initial Commit
-   Untracked File
-   HEAD:
    -   `HEAD`: Git’s way of referring to the current snapshot. Internally, the ‘git checkout’ command simply updates the HEAD to point to either the specified branch or commit. When it points to a branch, Git doesn’t complain, but when you check out a commit, it switches into a “detached HEAD” state.
    -   Head Pointer always points to the Active Branch. When it points to a branch, Git doesn’t complain, but when you check out a commit, it switches into a “detached HEAD” state.
    -   Detached Head
-   TAG:
    -   Tag is an extra lebel for a commit in the commit chain that can indicate usefull informations. A tag is not updated by the commit command.
    -   Annoted Tag
    -   Lightwaight Tag
-   `remote`
-   `origin`
    -   origin/master is the state of master branch on remote repository
    -   origin - This is a custom and most common name to point to remote.
    -   origin/master - This is just a pointer to refer master branch in remote repo. Remember I said origin points to remote.
-   `master`

    -   master - The default branch name in Git is master. For both remote and local repository.
    -   master is the state of master branch on local repository

-   `working directory`
-   `staging area`
-   `local master`
-   `GitHub master`
-   fork

🔥 NOTES:

-   There generally are at least three copies of a project on your workstation:

    -   One copy is your own repository with your own commit history (the already saved one, so to say).
    -   The second copy is your working copy where you are editing and building (not committed yet to your repo).
    -   The third copy is your local “cached” copy of a remote repository (probably the original from where you cloned yours).

-   You cannot delete the branch you are on.
-   If you checkout a branch and then commits, the branch’s label autometically updates to the new commits.
-   ![Git Push/Pull Cycle](/assets/git/git_cycle.png)

</details>

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">Git Commands</summary>

🔥 HELP:

-   `$ git --help`
-   `$ git help -a`
-   `$ git help -g`
-   `$ git help <command> -->> Ex: git help add, git help reset, git help rm`
-   `$ git help <concept>`
-   `$ git help git`
-   `$ git [options] commands [<args>]`

## Initialize/Clone Git Repository

-   There are two methods to start a git projects:

    1. Cloning an Existing Repository from www.github.com using git command, (`$ git clone`)
    2. Initializing a Git Repository skeleton in the local machin using git command, (`$ git init`) then push it into a remote location such as `www.github.com` after establishing a link to the remote repository ,

-   `$ git clone https://github.com/repoName` → It creates a repository named “repoName”, initializes a .git directory inside it, pulls down all the data from that repository, and checks out a working copy of the latest version.
-   `$ git init` → It creates a new subdirectory named .git that contains all of your necessary repository files – a Git repository skeleton.
-   `$ git init <folder_name>` → It creates a new directory named folder_name in current directory and initialize a git repository – a Git Repository Skeleton - in it.
-   `$ git remote add origin <URL>` → Add the repository, named ‘origin’, from the remote (GitHub) to the local machin through given ‘url’. Conventionaly the word ‘origin’ is used as the name of remote repository, but the link between the locally initialized git repository and the remote(GitHub) get established through the provided URL, not through the name of remote repository, ‘origin’
    `$ git remote add origin git@github.com:Aminul-Momin/TestingProj.git`
-   `$ git config --global user.name 'Aminul Momin'`
-   `$ git config --global user.email A.Momin.NYC@gmail.com`
-   `$ git config --global init.defaultBranch <master_branch>` → setup the initial branch name to create in all new repositories.
-   `$ 🔥 git remote set-url origin git@github.com:Aminul-Momin/<repository_name>.git` → Change your remote's URL from `HTTPS to SSH`. (SSH based Authentication)
-   `$ git remote` → List out all the remote this git repo has been added to
-   `$ git remote -v` → Listout all the remote’s URL this git repo has been added to

## CONFIGURATIONS

-   `.git/config` → Git's local configuration file.
-   `/usr/local/git/etc/gitconfig` → Git's Default configuration
-   `~/.gitconfig` → Git's user configuration file
-   `$ git config --local --list`
-   `$ git config --global --list`
-   `$ git config --get user.name` → Returns name of the current git user.
-   `$ git config --get user.email` → Returns the email address of current git user.
-   `$ git config --local --edit`
-   `$ git config --system --edit`
-   `$ git config --global --edit`
-   `$ Which git` → Print the full path to the git command
-   `$ git config --list` → List all the setting git can find at this point.
-   🔥 <bold style="color:orange">NOTES</bold>: When reading, the values are read from the system, global and repository local configuration files by default, and options `--system`, `--global`, `--local`, `--worktree` and `--file <filename>` can be used to tell the command to read from only that location (see FILES).
-   `$ git config --global core.editor code –wait [“subl –n -w”, emacs, “atom-wait”]`
-   `$ git config --global color.ui auto`
-   `$ git config --local user.name 'Aminul Momin'` → '--local' can only be used inside a git repository
-   `$ git config --local user.email "A.Momin.NYC@gmail.com"`
-   `$ git config --local user.email "A.Momin.NYC@gmail.com"`
-   `$ git config --local user.email "bbcredcap3@gmail.com"`
-   `$ git config --local user.email [author.name | author.email | committer.name | committer.email]`
-   `$ git config user.name [author.name | author.email | committer.name | committer.email]`
    -   Returns a specific key’s value ( here, key = user.name).
-   `$ 🔥 git remote set-url origin git@github.com:Aminul-Momin/Data-Analysis-Python.git`
    -   Change your remote's URL from HTTPS to SSH. (SSH based Authentication)
-   `$ 🔥 git remote set-url origin https://github.com/Aminul-Momin/Data-Analysis-Python.git`
    -   Change your remote's URL from HTTPS to SSH. (HTTPS (Token) based Authentication)
-   `$ git remote show origin` → get the remote origin URL
-   `$ git config --get remote.origin.url` → get the remote origin URL
-   `$ ssh -T git@github.com` → Test your Authentication/Connection into remote.
-   [Git and Vimdiff](https://medium.com/usevim/git-and-vimdiff-a762d72ced86)
    <!-- To tell Git to always use Vimdiff, issue the following commands: -->
-   `$ git config --global diff.tool vimdiff`
-   `$ git config --global merge.tool vimdiff`

## RECORD & EXAMIN CHANGES

-   `$ git status` → Check the current status.
-   `$ git diff` → Difference between Working Directory and Staging Area
-   `$ git diff --cached` → Show the difference between the index and the last commit.
-   `$ git diff branch` → Show a diff between the current working directory and the named branch.
-   `$ git diff --staged` → Difference between Staging Area and Repository.
-   `$ git diff <commit_id1 commit_id2>` → Difference between two commits.
-   `$ git diff --stat` → Shows an overview of changes.
-   `$ git log --pretty=format:"[%h] %ae, %ar: %s" --stat` → Shows commit history with the files that were changed.
-   `$ git show <commit_id>` → Show the changes in commits compared to it’s parrents
-   `$ git log <command>`
-   `$ git log --help`
-   `$ git log --statq`
-   `$ git log --oneline`
-   `$ git log --oneline --decorate`
-   `$ git log --graph --oneline --decorate --all`
-   `$ git add .` → Add changes of all files in the current & subdirectory to the Staging Area.
-   `$ git commit` → Commit into the Repository.
-   `$ git commit -m “Commit_Message”` → Commint into the Repository with Commit Message.

##### [git stash](https://www.youtube.com/watch?v=fXGug4itlTk)

-   `$ git stash` → stash uncommited local changes
    -   git stash temporarily shelves (or stashes) changes you've made to your working copy so you can work on something else, and then come back and re-apply them later on. Stashing is handy if you need to quickly switch context and work on something else, but you're mid-way through a code change and aren't quite ready to commit.
-   `$ git stash show` → show the content of your most recent stash.
-   `$ git stash list` → List out all your repository's stashes.
    -   `git stash show stash@{index}`
-   `$ git stash pop` → Popping your stash removes the changes from your stash and reapplies them to your working copy.
-   `$ git stash drop stash@{n}` → drop specific stash - see git stash list (`n` is a integer)
-   `$ git stash pop stash@{n}` → pop specific stash - see git stash list (`n` is a integer)
-

##### [Resetting, Reverting, and Checking Out](https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting)

-   [Undoing Commits & Changes](https://www.atlassian.com/git/tutorials/undoing-changes)
-   🔥 [git checkout]()

    -   `$ git checkout <commit_id>`
    -   `$ git checkout master`
    -   `$ git checkout <file_name>` → Discard the specified file from Working Area.
    -   `$ git checkout .` → Discard all the changes to the Working Area.
    -   `$ git checkout <commit_id>`
    -   `$ git checkout -- <file> ...` → to discard changes in working directory

-   🔥 [git reset]()

    -   <span style="color:orange">How to discard committed files? Extra care should be given using the reset command?</span>

    -   `$ git reset` → Removes all files from the staging area, but keeps the changes in your working directory. It effectively "unstages" all changes.
    -   `$ git reset HEAD <file_name>` → Unstage the specified file from Staging Area.
    -   `$ git reset HEAD */.` → Unstage all the file from Staging Area
    -   `$ git reset HEAD~1` → Discard the LAST commit from Local Repository (Committing Area). Discarted file kept in Working Area
    -   `$ git reset HEAD~3` → Discard the LAST THREE commit from Local Repository (Committing Area). Discarted file kept in Working Area
    -   `$ git reset --soft HEAD~3` → Discard the first three commit from Local Repository (Committing Area). Discarted file kept in Staging Area
    -   `$ git reset --hard` → COMPLETELY REMOVE EVERYTHING FROM LOCAL REPOSITORY (COMMITTING AREA) !!!!!!!!!!!!
    -   `$ git reset --hard HEAD~2`
    -   <font color="orange">How do I unstage changes?</font>
    -   `$ git restore .`
        -   It can be used to undo the effects of `git add` and unstage changes you have previously added to the Staging Area.
        -   It can also be used to discard local changes in a file, thereby restoring its last committed state.
    -   `$ git restore path/to/file/to/revert` → Unstage the given file from Staging Area into Working Directory.
    -   `$ git-clean` → Remove untracked files from the working tree.
    -   `$ git rm --cached <file_name>` → Unstage the specified file (`file_name`) from Staging Area.
    -   `$ git rm --cached *_initial.py` → Unstage all the files name ended with `_initial.py` from Staging Area.
    -   `$ git rm -r --cached */migrations/` → Unstage all (`store/*`) files recursively from Staging Area.
        -   NOTE: `--cached` option tells Git to only remove the folder from the Git repository's index (staging area) and not from the file system. The files in the folder will no longer be tracked by Git, but they will remain on your local disk.
    -   `$ git revert` → it's better to use `git revert` to create a new commit that undoes the changes made in the previous commit.
    -   <span style="color:orange">How to remove a commit from remote repository:</span>
        1. git reset <commit_id>
        2. git push origin master -f

## GIT BRANCHING & MEARGING FILES

-   🔥 [git branch](https://www.atlassian.com/git/tutorials/using-branches)

    -   `$ git branch -h`
    -   `$ git checkout -h`
    -   `$ git branch <new_branch_name>` → Creates a brnch with the specified branch_name.
    -   `$ git checkout -b <new_branch_name>` → Create & checkout the specified new_branch_name.
    -   `$ git branch –d <branch_name>` → Deleting a branch won’t delete the commits. It only deletes the label.
    -   `$ git branch <branch_name> <commit_id>`
    -   `$ git checkout <branch_name>` → Checkout the specified branch_name.
    -   `$ git branch –a` → Show all the name of branches that has been created so far
    -   `$ git log –graph –onetime <branch_name1 branch_name2 … >` → Visulize the branches Structure

-   🔥 TAG:

    -   `$ git tag` → List out all tags created fo far.
    -   `$ git tag BASELINE` → Create the 'BASELINE' tag.
    -   `$ git tag -a <lebel_of_tag>` → Creates a Annoted Tag, extra informations.
    -   `$ git tag -d <name_of_tag_to_be_deleted>` → Deletes the specified tag.
    -   `$ git tag -a <lebel_of_tag> <commit_id>` → Tags a older commit.
    -   `$ git tag < -l | --list >` → List all tags created so far.
    -   `$ git push --tags` → Push all the tags into remote (github.com)

-   🔥 [MERGING](https://www.atlassian.com/git/tutorials/using-branches/git-merge):

    -   `$ git merge <origin_branch_name> < local_branch_name>` → Merge a local branch into a origin branch.
    -   `$ git merge <local_branch_name1> < local_branch_name2>` → Merges two branches in local repository.
    -   `$ git merge —abort` → Abort merge if it is not possible to merge for any reason.

-   🔥 PUSH/PULL/FETCH:
    -   `$ git remote set-url origin git@github.com:Aminul-Momin/Algorithms_and_Data_Structures.git` → to set remote origin url
    -   `$ git remote show origin` → get the remote origin URL
    -   `$ git remote add upstream <URL>`
    -   `$ git push origin master`
        -   `origin` is master branch of remote repository
        -   `master` is master branch of local repository
        -   Pushes the master branch of local repository to master branch of remote repository.
    -   `$ git push -u origin master`
    -   `$ git push origin` → push all the branches to origin
    -   `git fetch` is the command that tells your local git to retrieve the latest meta-data info from the original (yet doesn’t do any file transferring. It’s more like just checking to see if there are any changes available).
    -   `git pull` on the other hand does that AND brings (copy) those changes from the remote repository.
    -   `$ git pull origin master`
        -   `origin` is master branch of remote repository
        -   `master` is master branch of local repository
        -   pulls the master branch of remote repository into master branch of local repository.
        -   It's equivalent to `$ git fetch origin && git merge origin master`
    -   `$ git pull upstream Master`
    -   `$ git fetch`
    -   `$ git fetch origin`
    -   `$ git fetch origin/master master`

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Github CLI Commands</summary>

### Authentication and Configuration

-   `$ gh auth status`
-   `$ gh config get --list`
-   `$ gh auth login`
-   `$ gh ssh-key list`
-   `$ gh ssh-key add ~/.ssh/id_rsa.pub --title "Your SSH Key Title"`
-   `$ `
-   `$ `
-   `$ `

### Repository Management

-   `$ gh repo clone owner/repo`
-   `$ gh repo create [repo_name]`
-   `$ gh repo view [owner/repo]`
-   `$ gh repo list`
-   `$ gh repo list --fork`
-   `$ gh repo list --source`

### Issue Management

-   `$ gh issue create`
-   `$ gh issue view [number]`
-   `$ gh issue list`
-   `$ gh issue list --state closed`
-   `$ gh issue list --assignee [username]`

### Pull Request Management

-   `$ gh pr create`
-   `$ gh pr view [number]`
-   `$ gh pr list`
-   `$ gh pr list --state closed`
-   `$ gh pr list --assignee [username]`

### Workflow and Actions

-   `$ gh workflow view`
-   `$ gh workflow run [workflow_name]`
-   `$ gh run view [run_number]`

### Collaborator and Team Management

-   `$ gh repo collaborator add [username]`
-   `$ gh repo collaborator remove [username]`
-   `$ gh team list`
-   `$ gh team list-members [team_slug]`

### Git Operations

-   `$ gh repo create branch-name`
-   `$ gh repo view --json default_branch`
-   `$ gh pr create --draft`
-   `$ gh pr view --draft`

### MISC

-   `$ gh repo delete <repository>`
-   `$ `
-   `$ `

</details>
