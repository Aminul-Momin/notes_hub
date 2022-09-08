### Refferances:

-   [Docker Commands Cheat Sheet](https://buddy.works/tutorials/docker-commands-cheat-sheet#docker-container-commands)
-   [Docker Cheat Sheet](https://intellipaat.com/blog/tutorial/devops-tutorial/docker-cheat-sheet/)
-   [The Docker Handbook – 2021 Edition](https://www.freecodecamp.org/news/the-docker-handbook/)
    -   [the-docker-handbook](https://github.com/fhsinchy/the-docker-handbook)

### [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

-   [Install using the repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
-   [Install using the convenience script](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

---

-   sudo systemctl status docker
    -   Check whether Docker is running or not in Linux machine.

---

### How to check Vertion of Docker?

-   `$ docker --version`
-   `$ docker version`
-   `$ docker-compose --version`

## docker:

-   [docker](https://docs.docker.com/engine/reference/commandline/docker/):

-   [Use the Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)

### [$ docker run](https://docs.docker.com/engine/reference/commandline/run/): `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`

-   `$ docker run <image_name>`

    -   Pull image_name down it not available in docker-host (Local Machine) and instentiate and run an image_name_container from image_name image.
    -   Run in _Attach Mode_. Add `-d` option to run in _Detach Mode_
    -   EX: `$ docker run nginx`.

-   `$ docker pull <image_name>`

    -   Just pull down the image into the docker-host (Local machine) form docker registry (Docker Hub)

-   `Run - tag`:

    -   `$ docker run <image_name:tag`

-   `Run - STDIN`:

    -   `$ docker run -it <image_name>`
    -   `$ docker run python:3.7`
        -   Run in interactive mode.

-   `Run - PORT Mapping`:
    -   `$ docker run -it 80: 5000 dockerized_flask_app/app`

![docker_port_mapping](../assets/docker_port_mapping.png)

-   `Run - VOLUME Mapping`:

    -   `$ docker run -p 8080:5000 mysql`
    -   `$ docker stop mysql`
    -   `$ docker rm mysql`

    -   `$ docker rm -v /dir_out_container:/dir_in_container mysql`
        -   map a diractory outside of container to a diractory inside of container
    -   `$ docker rm -v /opt/datadir:/var/lib/mysql mysql`
    -

-   `Inspect a Container`:

    -   `$ docker inspect <container_name | container_id>`
        -   Return details of a container in json format.

-   `Container Logs`:

    -   `$ docker logs <container_name | container_id>`
        -   Show the logs of a container ran in gackgroun (detach mode).

-   `Environment Variables`:

    -   `$ docker run -e APP_COLOR=blue dockerized_flask_app/app`

-   `Various Modes of Container`:

    -   `$ docker run -d image_name`

        -   Run in _Detach Mode_.

    -   `$ docker attach <container_id>`

        -   Run in _Attach Mode_ back.

    -   `$ docker run -it dockerzied_flask_app/app`
        -   Run a custom dockerized flask application in interactive mode.

### [$ docker ps](https://docs.docker.com/engine/reference/commandline/ps/): `docker ps [OPTIONS]`

-   `$ docker ps`

    -   list out only the running containers

-   `$ docker cp ./<my_new_dag.py> dagvaol_host:/dags`
    -   Copy my_new_dag.py from CWD to allocated dag volume in the docker container.

### [$ docker ](): ``

### [$ docker stop](https://docs.docker.com/engine/reference/commandline/stop/): `docker stop [OPTIONS] CONTAINER [CONTAINER...]`

-   `$ docker stop <container_id | container_name>`
    -   Stop the given running container keeping the instance of the container for later use.

### [$ docker kill](https://docs.docker.com/engine/reference/commandline/kill/): `docker kill [OPTIONS] CONTAINER [CONTAINER...]`

### [$ docker rm](): ``

-   `$ docker rm <container_id | container_name>`
    -   Remove the instance of container previously created.

### [$ docker images](): ``

-   `$ docker images`
    -   List out images available local machine. (in docker host)

### [$ docker rmi](): ``

-   `$ docker rmi <image_name>`
    -   Remove the image_name previously pulled down from docker registry.
    -   EX: `$ docker rmi nginx`.
    -   Must not running any container of the image.

### Run Linux Operating System Image:

-   `$ docker run ubuntu`

    -   Runs an Ubuntu image and exites immediately.

    -   `$ docker ps`

-   `$ docker run ubuntu sleep 60`

    -   `$ docker ps`

-   `$ docker `
-   `$ docker `

### [$ docker exec](https://docs.docker.com/engine/reference/commandline/exec/): `docker exec [OPTIONS] CONTAINER COMMAND [ARG...]`

-   `$ docker exec`

    -   Usage: `$ docker exec -it <container_id | container_name> bash`
    -   This command is used to access the running container

### [$ docker image](): ``

### [$ docker build](https://docs.docker.com/engine/reference/commandline/build/): `docker build [OPTIONS] PATH | URL | -`

-   `$ docker build`

    -   Usage: docker build <path to docker file>
    -   This command is used to build an image from a specified docker file

### [$ docker ](): ``

### [$ ](): ``

---

## Docker Compose:

-   [Using Volume in Docker Compose](https://devopsheaven.com/docker/docker-compose/volumes/2018/01/16/volumes-in-docker-compose.html)

---

-   [docker-compose](https://docs.docker.com/compose/reference/):

-   [Compose CLI environment variables](https://docs.docker.com/compose/reference/envvars/)

-   `$ docker-compose `
-   `$ docker-compose `
-   `$ docker-compose `
-   `$ docker-compose `

### [$ ](): ``

### [$ ](): ``

---

---

## Rough:

-   `$ docker commit`

    -   docker commit <conatainer_id> <username/imagename>

    -   This command creates a new image of an edited container on the local system

### Run Container:

-   `$ docker run <image name>`

    -   `$ docker run hello-world`

-   Although this is a perfectly valid command, there is a better way of dispatching commands to the docker daemon.
-   Prior to version 1.13, Docker had only the previously mentioned command syntax. Later on, the command-line was restructured to have the following syntax:

-   `$ docker <object> <command> [options] [...]`

    -   `$ docker container run -d <image_name>`
    -   `$ docker container run --detach --publish 8080:80 fhsinchy/hello-dock`
    -   `$ docker volume create volume_my_data`
    -   `$ docker network create --drive bridge --subnet 128.18.0.0/16 custom_isolated_network`

    -   `object` indicates the type of Docker object you'll be manipulating. This can be a `container`, `image`, `network` or `volume` object.
    -   `command` indicates the task to be carried out by the daemon, for instance, the run command.
    -   `options` can be any valid parameter that can override the default behavior of the command, like the `--publish` option for port mapping.

    -   `--publish (-p) 8080:80` indicates that any request sent to port 8080 of your host system will be forwarded to port 80 inside the container‌.
    -   `--detach (-d)` option is provided to keep container running without terminal to keep running .
    -   One thing that you have to keep in mind in case of the run command is that the image name must come last. If you put anything after the image name then that'll be passed as an argument to the container entry-point (explained in the [Executing Commands Inside a Container]() sub-section) and may result in unexpected situations.

-   `$ ctrl + c`

-   `$ docker container ls`

    -   List out containers that are currently running.

-   `$ docker container ls --all`

    -   List out containers that are currently running and were run in past.

-   `$ `
-   `$ docker ps -a`
    -   List all the containers that are currently running or have run in the past.

### Stop/kill Container:

-   `$ docker container stop <container_identifier>`
-   `$ docker container kill <container_identifier>`

    -   If you use the name as identifier, you'll get the name thrown back to you as output. The stop command shuts down a container gracefully by sending a SIGTERM signal. If the container doesn't stop within a certain period, a SIGKILL signal is sent which shuts down the container immediately.
    -   In cases where you want to send a SIGKILL signal instead of a SIGTERM signal, you may use the container kill command instead. The container kill command follows the same syntax as the stop command.

-   `$ `

### Restart/Reboot Container:

-   Restart: The container which were previously stoped or killed
-   Reboot: The container which are currently running.

-   `$ docker container start <container_identifier`

    -   The container start command can be used to start any stopped or killed container.
    -   The container start command starts any container in detached mode by default and retains any port configurations made previously.

-   `$ docker container restart <container_identifier`

-   The main difference between the two commands is that the container restart command attempts to stop the target container and then starts it back up again, whereas the start command just starts an already stopped container.
-   In case of a stopped container, both commands are exactly the same. But in case of a running container, you must use the container restart command.

### docker-compose:

-   `$ docker-compose build`
-   `$ docker-compose up -d`
-   `$ docker-compose down`

### Docker Volume:

-   Anonymous: Randomly created and maintained by Docker.
-   Host: Mount a local directory or file on the container
-   Named: Created with a name and maintaied by Docker

### Usefull Commands in case of non-responsive Dockers in RHEL

-   ps -auxwww | head -n1
-   cat sos_commands/process/ps_auxwww | awk '$8 ~ /D/'
-   echo 1 > /proc/sys/kernel/sysrq
-   echo w > /proc/sysrq-trigger
