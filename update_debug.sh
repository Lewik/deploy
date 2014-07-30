#!/bin/bash

source ./bin/settings.conf.sh

#переместить в Debug

mkdir -pv ${srv_debug}
cp -a $FILE/* ${srv_debug}

#логирование
DATE=`date +%Y-%m-%d:%H:%M:%S`
echo "$DATE Debug updated ">> ${scp_log}