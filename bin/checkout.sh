#!/bin/bash

source bin/settings.conf
ROOT_PATH=$(cd $(dirname $0) && pwd);



echo "git checkout"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	cd ${erzakaz[localfolder]}
	git checkout  $1
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	cd ${erreestr[localfolder]}
	git checkout  $1
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	cd ${ercommon[localfolder]}
	git checkout  $1
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	cd ${erportal[localfolder]}
	git checkout  $1
fi

if [ ${ersf[enable]} ]; then
	echo "ersf"
	cd ${ersf[localfolder]}
	git checkout  $1
fi
echo "ready"



cd ${ROOT_PATH}