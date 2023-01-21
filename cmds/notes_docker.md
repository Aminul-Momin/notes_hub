### Refferances:

-   [Docker and Kubernetes Complete Tutorial](https://www.youtube.com/playlist?list=PL0hSJrxggIQoKLETBSmgbbvE4FO_eEgoB)
-   [Dockerfile Components](https://github.com/wsargent/docker-cheat-sheet#dockerfile)
-   [Docker Commands Cheat Sheet](https://buddy.works/tutorials/docker-commands-cheat-sheet#docker-container-commands)
-   [Docker Cheat Sheet](https://intellipaat.com/blog/tutorial/devops-tutorial/docker-cheat-sheet/)
-   [The Docker Handbook – 2021 Edition](https://www.freecodecamp.org/news/the-docker-handbook/)
    -   [the-docker-handbook](https://github.com/fhsinchy/the-docker-handbook)

### [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

-   [Install using the repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
-   [Install using the convenience script](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

-   `$ sudo systemctl status docker` → Check whether Docker is running or not in Linux machine.

-   `$ docker --version`
-   `$ docker version`
-   `$ docker-compose --version`
-   `/var/lib/docker/`
    -   `/aufs`
    -   `/containers`
    -   `/image`
    -   `/volumes`
-   `$ docker info`
-   `$ sudo service docker status`
-   `$ systemctl is-active docker`
<details>
<summary style="font-size:25px;color:Orange;text-align:left">Terminology</summary>

-   Attach Mode: In the attached mode, Docker can start the process in the container and attach the console to the process’s standard input, standard output, and standard error.When you run a Docker run command, it runs in the foreground or in an attached mode, meaning you will be attached to the console or the standard out of the Docker container. And you will see the output of the web service on your screen. You won't be able to do anything else on this console other than view the output until this Docker container stops. It won't respond to your inputs. press the `ctrl+c` combination to stop the container and the application hosted on the container exits and you get back to your prompt.
-   Detach Mode: Detach mode started by the option `--detach` or `–d` flag in docker run command, means that a Docker container runs in the background of your terminal. It does not receive input or display output. Using detached mode also allows you to close the opened terminal session without stopping the container. The container will continue to run in the backend, run the docker ps command to view the running container. Now if you would like to attach back to the running container later, run the `docker attach con_id/con_name` command and specify the name or ID of the Docker container.
-   Bind Mount vs Volium Mount:
-   Context
-   Build Stage
-   Layer

</details>

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">docker</summary>

-   [docker](https://docs.docker.com/engine/reference/commandline/docker/) | [Use the Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)
-   [docker run](https://docs.docker.com/engine/reference/commandline/run/)
-   [Add bind mounts, volumes or memory filesystems](https://docs.docker.com/engine/reference/commandline/service_create/#add-bind-mounts-volumes-or-memory-filesystems)

-   `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`

    ```bash
    docker run -dit -- rm \
    -e WORKING_DIR=/User/a.momin/Data \     # Set environment variables
    -w /code \                              # Working directory inside the container
    -p 8010:8012 \                          # Publish a container's port(s) to the host
    -- expose 80 \                          # Expose a port or a range of ports
    --read-only -v /icanwrite \             # Mount the container's root filesystem as read only
    -v `pwd`:`pwd` \
    -v /doesnt/exist:/foo \                 # When the host directory of a bind-mounted volume doesn’t exist, Docker will automatically create this directory on the host for you.
    --read-only --mount type=volume,target=/icanwritetoo \
    --mount type=bind,src=/data,dst=/data \
    -w `pwd` \
    --entrypoint sleep                      # overridding entrypoint with bash command `sleep`
    --network=network_name \
    --name=container_name \
    image_name:latest param1                # Append parameter `param1` to entrypoint bash command (`sleep param1`)
    ```

-   `$ docker inspect container_name` → Inspect the created contaner named by `container_name`

-   `$ docker run -d --name=name_your_container <image_name>`

    -   Pull image_name down if it's not available in docker-host (Local Machine) and instantiate and run an image_name_container from image_name image.
    -   Run in _Attach Mode_. Add `-d` option to run in _Detach Mode_
    -   `--name=name_your_container` is used to give the container a name to refer it later
    -   EX: `$ docker run nginx`.

-   `$ docker pull <image_name>` → Just pull down the image into the docker-host (Local machine) form docker registry (Docker Hub)

-   `Run - STDIN`:

    -   `$ docker run -it <image_name>` → Run in interactive (`i`) mode with terminal (`t`) aatched to it.
    -   `$ docker run python:3.7`

-   `Run - PORT Mapping`:
    -   `$ docker run -it 80:5000 dockerized_flask_app/app`

![docker_port_mapping](../assets/docker_port_mapping.png)

-   Run - VOLUME Mapping:

    -   `$ docker run -v /dir_out_container:/dir_in_container mysql`

-   Inspect a Container:

    -   `$ docker inspect <container_name | container_id>` → Return details of a container in json format.

-   Container Logs:

    -   `$ docker logs <container_name | container_id>` → Show the logs of a container ran in backgroun (detach mode).
    -   `$ docker logs -f <container_name | container_id>` → Show the logs of a container ran in backgroun (detach mode) with `-f` (--follow) following log output.
    -   `$ docker attach <container_id>` → Run (without `-d` option) in _Attach Mode_ back.

-   [$ docker ps](https://docs.docker.com/engine/reference/commandline/ps/): `docker ps [OPTIONS]`

    -   `$ docker ps` → list out only the running containers
    -   `$ docker cp ./<my_new_dag.py> dagvaol_host:/dags` → Copy my_new_dag.py from CWD to allocated dag volume in the docker container.
    -   `$ docker ps --format "table {{.Names}}:\t{{.Ports}}\t{{.Status}}"` → Print the result of `docker pa` in the given format.

-   [$ docker stop](https://docs.docker.com/engine/reference/commandline/stop/): `docker stop [OPTIONS] CONTAINER [CONTAINER...]`

    -   `$ docker stop <container_id | container_name>` → Stop the given running container keeping the instance of the container for later use.

-   [$ docker kill](https://docs.docker.com/engine/reference/commandline/kill/): `docker kill [OPTIONS] CONTAINER [CONTAINER...]`
    -   The docker kill subcommand kills one or more containers. The main process inside the container is sent SIGKILL signal (default), or the signal that is specified with the --signal option. You can reference a container by its ID, ID-prefix, or name. While the default (SIGKILL) signal will terminate the container, the signal set through --signal may be non-terminal, depending on the container’s main process. For example, the SIGHUP signal in most cases will be non-terminal, and the container will continue running after receiving the signal.
-   [$ docker rm](): ``

    -   `$ docker rm <container_id | container_name>` → Remove the instance of container previously created.
    -   `$ docker images` → List out images available in docker host (local machine or remote server)

    -   `$ docker rmi <image_name>`
        -   Remove the image_name previously build or pulled down from docker registry.
        -   EX: `$ docker rmi nginx`.
        -   Must not running any container of that image.

-   Runing Special UBUNTU Image:

    -   When you run the Docker run Ubuntu command it runs an instance of Ubuntu image and exits immediately.
    -   Now why is that? Unlike virtual machine containers are not meant to host an operating system. Containers are meant to run a specific task or process such as to host an instance of a web server or application server or a database, or simply to carry some kind of computation or analysis task. Once the task is complete, the container exits. A container only lives as long as the process inside it is alive. If the web service inside the container is stopped, or crash, then the container exits.

    -   `$ docker run ubuntu` → Runs an Ubuntu image and it exites immediately.

        -   `$ docker ps`

    -   `$ docker run ubuntu sleep 60`

        -   `$ docker ps`

    -   `$ docker run ubuntu sleep 5`
        -   Start container with a command `sleep 5`
    -   `$ docker `
    -   `$ docker `

-   [$ docker exec](https://docs.docker.com/engine/reference/commandline/exec/): `docker exec [OPTIONS] CONTAINER COMMAND [ARG...]`

    -   `$ docker exec -it <container_id | container_name> bash` → This command is used to access the running container

-   [$ docker image](): ``

    -   `docker images` → List our images
    -   `$ docker image tag image_name new_image_name` → Take the backup of image_name by new name `new_image_name`

-   [$ docker build](https://docs.docker.com/engine/reference/commandline/build/): `docker build [OPTIONS] PATH | URL | -`

    -   `$ docker build -t my_image .`
        -   passing the -t flag to “tag” the new image with a name, which in this case will be my_image. The `.` indicates that the Dockerfile is in the current directory, along with so-called “context” — that is, the rest of the files that may be in that location

-   `$ docker pull image_name` - Just pull the image from docker registry but don't run it.

-   `$ docker cp . volume_name:folder_name`
    -   Copy content of current directory in the `folder_name` of `volume_name`.

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">docker network</summary>

-   [docker network](https://docs.docker.com/engine/reference/commandline/network/)
-   `$ docker network COMMAND`
-   `$ docker network create [OPTIONS] NETWORK`
-   `$ docker network ls [OPTIONS]`
-   `$ docker network inspect [OPTIONS] NETWORK [NETWORK...]`
-   `$ docker network rm NETWORK [NETWORK...]`
-   `$ docker network prune [OPTIONS]`
    -   Remove all unused networks. Unused networks are those which are not referenced by any containers.
-   `$ `

</details>

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">docker volume</summary>

-   `$ docker volume create [OPTIONS] [VOLUME]`
-   `$ docker volume create [OPTIONS] [VOLUME]`
-   `$ docker volume ls [OPTIONS]`
-   `$ docker volume inspect [OPTIONS] VOLUME [VOLUME...]`
-   `$ docker volume rm [OPTIONS] VOLUME [VOLUME...]`
-   `$ docker volume prune [OPTIONS]`
    -   Remove all unused local volumes. Unused local volumes are those which are not referenced by any containers
-   `$ `

</details>

</details>

---

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">docker-compose</summary>

## Docker Compose:

-   [Using Volume in Docker Compose](https://devopsheaven.com/docker/docker-compose/volumes/2018/01/16/volumes-in-docker-compose.html)

---

-   [docker-compose](https://docs.docker.com/compose/reference/):

-   [Compose CLI environment variables](https://docs.docker.com/compose/reference/envvars/)

-   `$ docker-compose up -d`
-   `$ docker-compose up --build`
-   `$ docker-compose build`
-   `$ docker-compose down`
-   `$ docker-compose `

### [$ ](): ``

### [$ ](): ``

<details open>
<summary style="font-size:25px;color:Orange;text-align:left">Sample docker-compose.yaml</summary>

-   [Sample docker-compose.yaml](https://airflow.apache.org/docs/apache-airflow/stable/docker-compose.yaml)

```yaml
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

# Basic Airflow cluster configuration for CeleryExecutor with Redis and PostgreSQL.
#
# WARNING: This configuration is for local development. Do not use it in a production deployment.
#
# This configuration supports basic configuration using environment variables or an .env file
# The following variables are supported:
#
# AIRFLOW_IMAGE_NAME           - Docker image name used to run Airflow.
#                                Default: apache/airflow:2.4.2
# AIRFLOW_UID                  - User ID in Airflow containers
#                                Default: 50000
# Those configurations are useful mostly in case of standalone testing/running Airflow in test/try-out mode
#
# _AIRFLOW_WWW_USER_USERNAME   - Username for the administrator account (if requested).
#                                Default: airflow
# _AIRFLOW_WWW_USER_PASSWORD   - Password for the administrator account (if requested).
#                                Default: airflow
# _PIP_ADDITIONAL_REQUIREMENTS - Additional PIP requirements to add when starting all containers.
#                                Default: ''
#
# Feel free to modify this file to suit your needs.
---
version: "3"
x-airflow-common: &airflow-common
    # In order to add custom dependencies or upgrade provider packages you can use your extended image.
    # Comment the image line, place your Dockerfile in the directory where you placed the docker-compose.yaml
    # and uncomment the "build" line below, Then run `docker-compose build` to build the images.
    image: ${AIRFLOW_IMAGE_NAME:-apache/airflow:2.4.2}
    # build: .
    environment: &airflow-common-env
        AIRFLOW__CORE__EXECUTOR: CeleryExecutor
        AIRFLOW__DATABASE__SQL_ALCHEMY_CONN: postgresql+psycopg2://airflow:airflow@postgres/airflow
        # For backward compatibility, with Airflow <2.3
        AIRFLOW__CORE__SQL_ALCHEMY_CONN: postgresql+psycopg2://airflow:airflow@postgres/airflow
        AIRFLOW__CELERY__RESULT_BACKEND: db+postgresql://airflow:airflow@postgres/airflow
        AIRFLOW__CELERY__BROKER_URL: redis://:@redis:6379/0
        AIRFLOW__CORE__FERNET_KEY: ""
        AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION: "true"
        AIRFLOW__CORE__LOAD_EXAMPLES: "true"
        AIRFLOW__API__AUTH_BACKENDS: "airflow.api.auth.backend.basic_auth"
        _PIP_ADDITIONAL_REQUIREMENTS: ${_PIP_ADDITIONAL_REQUIREMENTS:-}
    volumes:
        - ./dags:/opt/airflow/dags
        - ./logs:/opt/airflow/logs
        - ./plugins:/opt/airflow/plugins
    user: "${AIRFLOW_UID:-50000}:0"
    depends_on: &airflow-common-depends-on
        redis:
            condition: service_healthy
        postgres:
            condition: service_healthy

services:
    postgres:
        image: postgres:13
        environment:
            POSTGRES_USER: airflow
            POSTGRES_PASSWORD: airflow
            POSTGRES_DB: airflow
        volumes:
            - postgres-db-volume:/var/lib/postgresql/data
        healthcheck:
            test: ["CMD", "pg_isready", "-U", "airflow"]
            interval: 5s
            retries: 5
        restart: always

    redis:
        image: redis:latest
        expose:
            - 6379
        healthcheck:
            test: ["CMD", "redis-cli", "ping"]
            interval: 5s
            timeout: 30s
            retries: 50
        restart: always

    airflow-webserver:
        <<: *airflow-common
        command: webserver
        ports:
            - 8080:8080
        healthcheck:
            test: ["CMD", "curl", "--fail", "http://localhost:8080/health"]
            interval: 10s
            timeout: 10s
            retries: 5
        restart: always
        depends_on: <<: *airflow-common-depends-on
            airflow-init:
                condition: service_completed_successfully

    airflow-scheduler: <<: *airflow-common
        command: scheduler
        healthcheck:
            test:
                [
                    "CMD-SHELL",
                    'airflow jobs check --job-type SchedulerJob --hostname "$${HOSTNAME}"',
                ]
            interval: 10s
            timeout: 10s
            retries: 5
        restart: always
        depends_on:
            <<: *airflow-common-depends-on
            airflow-init:
                condition: service_completed_successfully

    airflow-worker: <<: *airflow-common
        command: celery worker
        healthcheck:
            test:
                - "CMD-SHELL"
                - 'celery --app airflow.executors.celery_executor.app inspect ping -d "celery@$${HOSTNAME}"'
            interval: 10s
            timeout: 10s
            retries: 5
        environment: <<: *airflow-common-env
            # Required to handle warm shutdown of the celery workers properly
            # See https://airflow.apache.org/docs/docker-stack/entrypoint.html#signal-propagation
            DUMB_INIT_SETSID: "0"
        restart: always
        depends_on: <<: *airflow-common-depends-on
            airflow-init:
                condition: service_completed_successfully

    airflow-triggerer: <<: *airflow-common
        command: triggerer
        healthcheck:
            test:
                [
                    "CMD-SHELL",
                    'airflow jobs check --job-type TriggererJob --hostname "$${HOSTNAME}"',
                ]
            interval: 10s
            timeout: 10s
            retries: 5
        restart: always
        depends_on: <<: *airflow-common-depends-on
            airflow-init:
                condition: service_completed_successfully

    airflow-init: <<: *airflow-common
        entrypoint: /bin/bash
        # yamllint disable rule:line-length
        command:
            - -c
            - |
                function ver() {
                  printf "%04d%04d%04d%04d" $${1//./ }
                }
                airflow_version=$$(AIRFLOW__LOGGING__LOGGING_LEVEL=INFO && gosu airflow airflow version)
                airflow_version_comparable=$$(ver $${airflow_version})
                min_airflow_version=2.2.0
                min_airflow_version_comparable=$$(ver $${min_airflow_version})
                if (( airflow_version_comparable < min_airflow_version_comparable )); then
                  echo
                  echo -e "\033[1;31mERROR!!!: Too old Airflow version $${airflow_version}!\e[0m"
                  echo "The minimum Airflow version supported: $${min_airflow_version}. Only use this or higher!"
                  echo
                  exit 1
                fi
                if [[ -z "${AIRFLOW_UID}" ]]; then
                  echo
                  echo -e "\033[1;33mWARNING!!!: AIRFLOW_UID not set!\e[0m"
                  echo "If you are on Linux, you SHOULD follow the instructions below to set "
                  echo "AIRFLOW_UID environment variable, otherwise files will be owned by root."
                  echo "For other operating systems you can get rid of the warning with manually created .env file:"
                  echo "    See: https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html#setting-the-right-airflow-user"
                  echo
                fi
                one_meg=1048576
                mem_available=$$(($$(getconf _PHYS_PAGES) * $$(getconf PAGE_SIZE) / one_meg))
                cpus_available=$$(grep -cE 'cpu[0-9]+' /proc/stat)
                disk_available=$$(df / | tail -1 | awk '{print $$4}')
                warning_resources="false"
                if (( mem_available < 4000 )) ; then
                  echo
                  echo -e "\033[1;33mWARNING!!!: Not enough memory available for Docker.\e[0m"
                  echo "At least 4GB of memory required. You have $$(numfmt --to iec $$((mem_available * one_meg)))"
                  echo
                  warning_resources="true"
                fi
                if (( cpus_available < 2 )); then
                  echo
                  echo -e "\033[1;33mWARNING!!!: Not enough CPUS available for Docker.\e[0m"
                  echo "At least 2 CPUs recommended. You have $${cpus_available}"
                  echo
                  warning_resources="true"
                fi
                if (( disk_available < one_meg * 10 )); then
                  echo
                  echo -e "\033[1;33mWARNING!!!: Not enough Disk space available for Docker.\e[0m"
                  echo "At least 10 GBs recommended. You have $$(numfmt --to iec $$((disk_available * 1024 )))"
                  echo
                  warning_resources="true"
                fi
                if [[ $${warning_resources} == "true" ]]; then
                  echo
                  echo -e "\033[1;33mWARNING!!!: You have not enough resources to run Airflow (see above)!\e[0m"
                  echo "Please follow the instructions to increase amount of resources available:"
                  echo "   https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html#before-you-begin"
                  echo
                fi
                mkdir -p /sources/logs /sources/dags /sources/plugins
                chown -R "${AIRFLOW_UID}:0" /sources/{logs,dags,plugins}
                exec /entrypoint airflow version
        # yamllint enable rule:line-length
        environment: <<: *airflow-common-env
            _AIRFLOW_DB_UPGRADE: "true"
            _AIRFLOW_WWW_USER_CREATE: "true"
            _AIRFLOW_WWW_USER_USERNAME: ${_AIRFLOW_WWW_USER_USERNAME:-airflow}
            _AIRFLOW_WWW_USER_PASSWORD: ${_AIRFLOW_WWW_USER_PASSWORD:-airflow}
            _PIP_ADDITIONAL_REQUIREMENTS: ""
        user: "0:0"
        volumes:
            - .:/sources

    airflow-cli: <<: *airflow-common
        profiles:
            - debug
        environment: <<: *airflow-common-env
            CONNECTION_CHECK_MAX_COUNT: "0"
        # Workaround for entrypoint issue. See: https://github.com/apache/airflow/issues/16252
        command:
            - bash
            - -c
            - airflow

    # You can enable flower by adding "--profile flower" option e.g. docker-compose --profile flower up
    # or by explicitly targeted on the command line e.g. docker-compose up flower.
    # See: https://docs.docker.com/compose/profiles/
    flower: <<: *airflow-common
        command: celery flower
        profiles:
            - flower
        ports:
            - 5555:5555
        healthcheck:
            test: ["CMD", "curl", "--fail", "http://localhost:5555/"]
            interval: 10s
            timeout: 10s
            retries: 5
        restart: always
        depends_on: <<: *airflow-common-depends-on
            airflow-init:
                condition: service_completed_successfully

volumes:
    postgres-db-volume:
```

</details>

## </details>

---

<details>
<summary style="font-size:25px;color:Orange;text-align:left">Miscellaneous</summary>

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

    -   `object` indicates the type of Docker object you'll be manipulating. This can be a `container`, `image`, `network` or `volume` object.
    -   `command` indicates the task to be carried out by the daemon, for instance, the run command.
    -   `options` can be any valid parameter that can override the default behavior of the command, like the `--publish` option for port mapping.

    -   `$ docker container run -d <image_name>`
    -   `$ docker container run --detach --publish 8080:80 fhsinchy/hello-dock`
    -   `$ docker volume create volume_my_data`
    -   `$ docker network create --drive bridge --subnet 128.18.0.0/16 custom_isolated_network`

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

</details>

<details>
<summary style="font-size:25px;color:Orange;text-align:left"> Sample Dockerfiles </summary>

-   [Dockerfile sample for Jupyter notebook images](https://www.ibm.com/docs/en/cloud-paks/cp-data/4.5.x?topic=image-dockerfile-sample-jupyter-notebook-images)
-   [Dockerfile Components](https://github.com/wsargent/docker-cheat-sheet#dockerfile)

```Dockerfile
ARG
FROM
ADD
COPY
CMD
```

</details>
