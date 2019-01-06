#!/bin/bash

options="$@"

docker run --rm -it mausy5043/syslog-ng-server:latest "${options}"
