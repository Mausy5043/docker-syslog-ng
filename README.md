# docker-syslog-ng

It is advised to pull the git repository and build you own image provided the latest build was successful.
On GitHub: [https://github.com/Mausy5043/docker-syslog-ng](https://github.com/Mausy5043/docker-syslog-ng)


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
Stops the container and then deletes it. This allows for immediate running a container with the same name without the need to `docker rm` it manually.

## Updating

```
./update.sh [--all]
```
Force pulls the files from Git. Use the `--all` switch to rebuild the image and restart the container.
