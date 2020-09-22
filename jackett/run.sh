#!/usr/bin/env bash
rm /data/log.txt || true
ln -s /dev/null /data/log.txt

~/Jackett/src/Jackett.Server/bin/Debug/netcoreapp3.1/linux-x64/jackett --DataFolder /data --NoUpdates 