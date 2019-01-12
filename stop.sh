#!/bin/bash

# stop the container
docker stop syslog-ng
# throw the container away so we can re-start it
docker rm syslog-ng
