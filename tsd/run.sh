#!/bin/bash
# https://stackoverflow.com/questions/32076878/logging-solution-for-multiple-containers-running-on-same-host

export DOCKER_HOST=unix:///var/run/docker.sock
dockerd --host=unix:///var/run/docker.sock > /dev/null &
pid=$!
cd ~/TheSpaghettiDetective
docker-compose up

wait $pid