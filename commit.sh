#!/bin/bash

source settings.conf

if [ -z $1 ]; then
	echo "first argument must be comment"
	exit 1
fi


echo "git commit"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	cd ${erzakaz[localfolder]}
	git add -A
	git commit -m  $1
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	cd ${erreestr[localfolder]}
	git add -A
	git commit -m  $1
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	cd ${ercommon[localfolder]}
	git add -A
	git commit -m  $1
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	cd ${erportal[localfolder]}
	git add -A
	git commit -m  $1
fi

if [ ${ersf[enable]} ]; then
	echo "ersf"
	cd ${ersf[localfolder]}
	git add -A
	git commit -m  $1
fi
echo "ready"