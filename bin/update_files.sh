#!/bin/bash

if [ -z $1 ]; then
	echo "first argument must be release or debug"
	exit 1
elif [ $1 = "release" ]; then
	DIR=${srv_prod}
elif [ $1 = "debug" ]; then
    DIR=${srv_debug}
else
    echo "first argument must be release or debug"
    exit 1
fi

#get folder name
cd ${scp_folder}

for file in ./*; do
  ZIP=${file##*/}
  break
done
FILE=${ZIP%.*}
echo "update name: $ZIP"


echo "moving folder to $1"

mkdir -p $DIR
cp -a $FILE/* $DIR


DATE=`date +%Y-%m-%d:%H:%M:%S`
echo "$DATE $1 updated " >> ${scp_log}
echo "ready"