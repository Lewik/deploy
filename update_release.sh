#!/bin/bash

source ./bin/settings.conf.sh

#переместить в Release

mkdir -pv ${srv_prod}
cp -a $FILE/* ${srv_prod}

#логирование
DATE=`date +%Y-%m-%d:%H:%M:%S`
echo "$DATE Release updated " >> ${scp_log}