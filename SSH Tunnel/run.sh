#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json
# copy options to bash
IP=$(jq --raw-output '.remote_ip // empty' $CONFIG_PATH)
PORT=$(jq --raw-output '.port // empty' $CONFIG_PATH)
BASE64KEY=$(jq --raw-output '.base64_key // empty' $CONFIG_PATH)
LOCALIP=$(jq --raw-output '.local_ip // empty' $CONFIG_PATH)
USERNAME=$(jq --raw-output '.username // empty' $CONFIG_PATH)

#install key
mkdir ~/.ssh || true
echo -n $BASE64KEY | base64 -di | grep -v "Base64" | tee ~/.ssh/id_rsa > /dev/null
#strip base64 errors

chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa

#register key
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

set -x # activate debugging from here

while true
do
    ssh -v -o StrictHostKeyChecking=no -o ExitOnForwardFailure=yes -N -T -p $PORT -R 443:$LOCALIP:443 -R 80:$LOCALIP:80  $USERNAME@$IP
    echo "Sleeping for 30 seconds"
    sleep 30 # wait 30 seconds before reconnecting
done