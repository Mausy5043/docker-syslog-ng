# docker-syslog-ng

It is advised to clone the Git repository and build your own image from that, provided the latest build (see [Docker Hub](https://hub.docker.com/r/mausy5043/syslog-ng)) was successful.  
On GitHub: [https://github.com/Mausy5043/docker-syslog-ng](https://github.com/Mausy5043/docker-syslog-ng
) DEPRECATED  
On GitLab: [https://gitlab.com/mausy5043-docker/syslog-ng](https://gitlab.com/mausy5043-docker/syslog-ng) ACTIVE


## Installing
The preferred procedure is:
```
git clone https://github.com/Mausy5043/docker-syslog-ng
cd docker-syslog-ng
```
Review the default settings in `config\etc_syslog-ng_syslog-ng.conf`.

```
./build.sh local
./run.sh local
```

This assumes that the host has at least the folder `/srv/array1/netsyslog` available which is the base directory where all logs are stored by syslog-ng. Adjust the  `config\etc_syslog-ng_syslog-ng.conf` file and `run.sh` if you want to use another directory.


## Build a fresh image

```
./build.sh local
```
This builds the image with tag `local`


## Run the image

```
./run.sh local
```
This runs a container using the image tagged `local`
It uses a custom `syslog-ng.conf` that is kept in `${HOME}/.config/docker/etc_syslog-ng_syslog-ng.conf`.


## Stop a running container

```
./stop.sh
```
Stops the container and then deletes it. This allows for immediately running a container with the same name without the need to `docker rm` it manually.


## Updating
FIRST!! Make a backup copy of  `config\etc_syslog-ng_syslog-ng.conf` and `run.sh` for your own mental health.

```
./update.sh [--all]
```
This force-pulls the files from Git. Use the `--all` switch to rebuild the image and restart the container immediately.
Be aware that this will overwrite any changes you may have made to the default configuration stored in `config\etc_syslog-ng_syslog-ng.conf`!

DISCLAIMER:
Use this software at your own risk! We take no responsibility for ANY data loss.
We guarantee no fitness for any use specific or otherwise.
