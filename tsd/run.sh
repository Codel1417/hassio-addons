#!/bin/bash
# https://stackoverflow.com/questions/32076878/logging-solution-for-multiple-containers-running-on-same-host
dockerd --host=unix:///var/run/shared/docker.sock
cd ~/TheSpaghettiDetective
docker-compose up