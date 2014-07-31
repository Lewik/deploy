#!/bin/bash

source ./bin/settings.conf.sh

pg_dump -h 127.0.0.1 -U er er -WFc > /srv/backup.dump

echo "DB backup created"

#логирование
DATE=`date +%Y-%m-%d:%H:%M:%S`
echo "$DATE $1 DB backup " >> ${scp_log}