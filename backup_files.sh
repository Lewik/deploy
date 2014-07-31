#!/bin/bash

source ./bin/settings.conf.sh

zip -qr Debug.zip ${srv_debug}
echo "Debug zipped to ${srv_debug}"

zip -qr Release.zip ${srv_prod}
echo "Release zipped to ${srv_prod}"

#логирование
DATE=`date +%Y-%m-%d:%H:%M:%S`
echo "$DATE $1 files backup " >> ${scp_log}
