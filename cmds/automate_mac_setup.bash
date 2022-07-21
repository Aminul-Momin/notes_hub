###############################################################################
#################################  FIREFOX ####################################


# brew install --cask firefox


###############################################################################
###########################   VISUAL STUDIO CODE ##############################

mac_install_vscode(){
    brew install --cask visual-studio-code
}


###############################################################################
#################################    MYSQL   ##################################

mac_install_mysql(){
    :'Installation of mysql'
    brew install mysql
}

mac_uninstall_mysql(){
    :'Unistallation of mysql'

    ps -ax | grep mysql  # stop and kill any MySQL processes
    sudo rm /usr/local/mysql
    sudo rm -rf /usr/local/var/mysql
    sudo rm -rf /usr/local/mysql*
    sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    sudo rm -rf /Library/StartupItems/MySQLCOM
    sudo rm -rf /Library/PreferencePanes/My*
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    # edit /etc/hostconfig and remove the line MYSQLCOM=-YES-
    rm -rf ~/Library/PreferencePanes/My*
    sudo rm -rf /Library/Receipts/mysql*
    sudo rm -rf /Library/Receipts/MySQL*
    sudo rm -rf /private/var/db/receipts/*mysql*
    sudo rm -rf /tmp/mysql*
    # # try to run mysql, it shouldn't work
}


###############################################################################
###############################     ANOCONDA    ###############################
mac_install_conda(){
    brew install --cask anaconda
    export PATH="/usr/local/anaconda3/bin:$PATH"
}
    