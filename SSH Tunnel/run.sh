#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json
# copy options to bash
IP=$(jq --raw-output '.ip // empty' $CONFIG_PATH)
PORT=$(jq --raw-output '.port // empty' $CONFIG_PATH)
BASE64KEY=$(jq --raw-output '.base64_key // empty' $CONFIG_PATH)
LOCALIP=10.0.0.223
USERNAME=$(jq --raw-output '.username // empty' $CONFIG_PATH)

#install key
mkdir ~/.ssh || true
echo -n $BASE64KEY | base64 -di | grep -v "Base64" | tee ~/.ssh/id_rsa
#strip base64 errors

chmod 600 ~/.ssh/id_rsa

#register key
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

set -x # activate debugging from here
#while false
#do
    ssh -vv -f -N -T -p $PORT -R 443:$LOCALIP:443 -R 80:$LOCALIP:80  $USERNAME@$IP
#done