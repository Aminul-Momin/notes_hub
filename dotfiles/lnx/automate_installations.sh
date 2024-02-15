lnx_load_dotfiles(){
    : ' Install short version 'notes_hub' into home directory
        NOTE:
    '
    mkdir -p $HOME/.my_dotfiles
    
    endpoint="https://raw.githubusercontent.com/Aminul-Momin/notes_hub/master/dotfiles/lnx"
    
    files=(bash_profile aliases git-completion.bash git-prompt.sh git-aliases.bash)
    for file in "${files[@]}"; do
        if [! -f $HOME/.my_dotfiles/$file ]; then
            touch $HOME/.my_dotfiles/$file
        fi
        curl $endpoint/.$file > $HOME/.my_dotfiles/$file
        ln -sf $HOME/.my_dotfiles/$file $HOME/.$file
    done
}


install_nginx_ubuntu(){
    sudo apt install python3-pip    # Install pip
    sudo apt-get install nginx      # Install Nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
}

install_java_ubuntu(){
    sudo apt-get update -y
    sudo apt install openjdk-17-jre  # Install Open JDK
    sudo apt-get update -y           # Update the System
    echo "Your java package is installed in '/usr/lib/jvm'"
    # export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
}

install_jenkins_ubuntu(){
    sudo apt-get update -y

    ## Source: https://www.jenkins.io/doc/book/installing/linux/#long-term-support-release
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt-get update
    sudo apt-get install jenkins

    sudo systemctl daemon-reload
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    sudo systemctl status jenkins
}


uninstall_jenkins_ubuntu(){
    : ' Uninstall Jenkins from Ubuntu '

    ## Stops the Jenkins service
    sudo systemctl stop jenkins
    ## Uninstalls the Jenkins package
    sudo apt-get purge jenkins
    ## Removes the Jenkins repository
    sudo rm /etc/apt/sources.list.d/jenkins.list
    ## Deletes Jenkins configuration and job directories
    sudo rm -rf /var/lib/jenkins/
    ## Deletes the Jenkins cache directory
    sudo rm -rf /var/cache/jenkins
    ## Updates the package database
    sudo apt-get update
}


uninstall_docker_ubuntu(){
    ## Uninstall From: https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions
    
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do 
        sudo apt-get remove $pkg; 
    done
    
    # Stops all running Docker containers.
    # sudo docker stop $(sudo docker ps -aq)
    # Removes Docker packages.
    sudo apt-get purge docker-ce docker-ce-cli containerd.io
    # Deletes Docker configurations, images, and volumes.
    sudo rm -rf /var/lib/docker
    # Removes unused dependencies.
    sudo apt-get autoremove
    # Removes Docker’s GPG key.
    sudo apt-key del $(sudo apt-key list | grep Docker | awk '{print $2}')

}

install_docker_ubuntu_main(){
    # Install From: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
    : '
        Installation procedures provided by the link avobe FAILD miserably !!
    '
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    # Install the latest verion of the Docker packages
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


    ## After installing Docker, you will need to start the Docker service
    sudo systemctl start docker

    sleep 20

    ## To start the Docker service automatically when the instance starts, you can use the following command
    sudo systemctl enable docker
    
    
    ## Add your user to the Docker group to run Docker commands without 'sudo'
    sudo usermod -a -G docker $(whoami)
    
    # You can log out and log back in to apply the changes or use the following command to activate the changes without logging out:
    newgrp docker

    # Verify that the Docker Engine installation is successful by running the hello-world image.
    sudo docker run hello-world

    echo "Docker Verion: $(docker --version)"
}

install_docker_ubuntu(){
    ## Install From: https://medium.com/@srijaanaparthy/step-by-step-guide-to-install-docker-on-ubuntu-in-aws-a39746e5a63d

    sudo apt-get update

    ## To install Docker on Ubuntu, you can use the following command
    sudo apt-get install docker.io -y

    ## After installing Docker, you will need to start the Docker service
    sudo systemctl start docker

    ## Verifying the installation. Once you have started the Docker service, you can verify that it is running by running the following command in your terminal
    sudo docker run hello-world

    ## To start the Docker service automatically when the instance starts, you can use the following command
    sudo systemctl enable docker
    
    docker --version
    
    ## Add your user to the Docker group to run Docker commands without 'sudo'
    sudo usermod -a -G docker $(whoami)
    
    # You can log out and log back in to apply the changes or use the following command to activate the changes without logging out:
    newgrp docker
}




