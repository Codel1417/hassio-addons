#!/bin/bash
# https://stackoverflow.com/questions/32076878/logging-solution-for-multiple-containers-running-on-same-host

export DOCKER_HOST=unix:///var/run/docker.sock
rm -fr /var/run/docker.sock
echo "{ \n "storage-driver": "overlay" \n}" | tee/etc/docker/daemon.json
dockerd --host=unix:///var/run/docker.sock > /dev/null &
cd ~/TheSpaghettiDetective
docker-compose up -d
