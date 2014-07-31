#!/bin/bash

source ./bin/settings.conf.sh

mkdir -pv ${bckp_folder}
cd ${bckp_folder}
NUM = find ${bckp_folder} -maxdepth 1 -type f | wc -l

if [ NUM -ge 10 ]; then
	#rm -rf 1
fi

NAME=`date +%Y%m%d%H00`

mkdir $NAME
cd $NAME

zip -qr Debug.zip ${srv_debug}
echo "Debug zipped to ${srv_debug}"

zip -qr Release.zip ${srv_prod}
echo "Release zipped to ${srv_prod}"

#логирование
DATE=`date +%Y-%m-%d:%H:%M:%S`
echo "$DATE $1 files backup " >> ${scp_log}
