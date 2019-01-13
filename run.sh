#!/bin/bash

tag="$1"

# Find out where we're running from
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f Dockerfile ]; then
  echo "Not allowed. First execute:"
  echo "cd ${SCRIPT_DIR}"
  echo " Then try again."
  exit 1
fi

docker run -d \
           --restart unless-stopped \
           -v "${PWD}/config/etc_syslog-ng_syslog-ng.conf":/etc/syslog-ng/syslog-ng.conf \
           -v /srv/array1/netsyslog:/srv/syslognet \
           -p 514:514/udp -p 601:601 -p 6514:6514 \
           --name syslog-ng \
           -h syslog-ng \
           "mausy5043/syslog-ng-server:${tag}"
