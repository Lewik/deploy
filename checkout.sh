#!/bin/bash

source settings.conf

if [ -z $1 ]; then
	echo "first argument must be branch"
	exit 1
fi

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