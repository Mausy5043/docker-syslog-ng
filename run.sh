#!/bin/bash

tag="$1"

docker run --rm -it \
           -v ../config/etc@syslog-ng@syslog-ng.conf:/etc/syslog-ng/syslog-ng.conf \
           -v /srv/array1/netsyslog:/srv/syslognet \
           "mausy5043/syslog-ng-server:${tag}"
