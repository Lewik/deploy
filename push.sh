#!/bin/bash

source bin/settings.conf.sh

ROOT_PATH=$(cd $(dirname $0) && pwd);

if [ -z $1 ]; then
	echo "first argument must be repo"
	exit 1
fi

if [ -z $2 ]; then
	echo "second argument must be branch"
	exit 1
fi

echo "git push"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	cd ${erzakaz[localfolder]}
	git push  $1 $2
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	cd ${erreestr[localfolder]}
	git push  $1 $2
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	cd ${ercommon[localfolder]}
	git push  $1 $2
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	cd ${erportal[localfolder]}
	git push  $1 $2
fi

if [ ${ersf[enable]} ]; then
	echo "ersf"
	cd ${ersf[localfolder]}
	git push  $1 $2
fi
echo "ready"

cd ${ROOT_PATH}