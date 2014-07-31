#!/bin/bash

source ./bin/settings.conf.sh

mkdir -pv ${bckp_folder}
cd ${bckp_folder}

#удаление файлов больше 10
#NUM = find ${bckp_folder} -maxdepth 1 -type f | wc -l

i=0
for file in `ls | sort -n`; do
    if [ $i -ge 10 ]; then
	    echo "deleted $file"
        rm -rf $file
    fi
    i=$((i+1))
done

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

#DB backup
pg_dump -h 127.0.0.1 -U er er -WFc | zip > backup.sql.zip

echo "DB backup created"

#логирование
DATE=`date +%Y-%m-%d:%H:%M:%S`
echo "$DATE $1 DB backup " >> ${scp_log}