#!/bin/bash
# https://stackoverflow.com/questions/32076878/logging-solution-for-multiple-containers-running-on-same-host
dockerd-entrypoint.sh "cd ~/TheSpaghettiDetective && docker-compose up"