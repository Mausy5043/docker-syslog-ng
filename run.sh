#!/bin/bash

tag="$1"

docker run --rm -it \
           -v "${HOME}/.config/docker/etc_syslog-ng_syslog-ng.conf":/etc/syslog-ng/syslog-ng.conf \
           -v /srv/array1/netsyslog:/srv/syslognet \
           -p 514:514 -p 601:601 -p 6514:6514 \
           "mausy5043/syslog-ng-server:${tag}"
