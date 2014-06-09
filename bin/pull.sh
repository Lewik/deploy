#!/bin/bash

ROOT_PATH=$(cd $(dirname $0) && pwd);
echo "git pull"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	cd ${erzakaz[localfolder]}
	git pull  $1 $2
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	cd ${erreestr[localfolder]}
	git pull  $1 $2
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	cd ${ercommon[localfolder]}
	git pull  $1 $2
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	cd ${erportal[localfolder]}
	git pull  $1 $2
fi

if [ ${ersf[enable]} ]; then
	echo "ersf"
	cd ${ersf[localfolder]}
	git pull  $1 $2
fi
echo "ready"
cd ${ROOT_PATH}