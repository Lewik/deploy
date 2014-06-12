#!/bin/bash

source bin/settings.conf.sh

echo "making dirs"
if [ ${erzakaz[enable]} ]; then
	mkdir -p -v ${erzakaz[localfolder]}
fi
if [ ${erreestr[enable]} ]; then
	mkdir -p -v ${erreestr[localfolder]}
fi
if [ ${ercommon[enable]} ]; then
	mkdir -p -v ${ercommon[localfolder]}
fi
if [ ${erportal[enable]} ]; then
	mkdir -p -v ${erportal[localfolder]}
fi
if [ ${ersf[enable]} ]; then
	mkdir -p -v ${ersf[localfolder]}
fi
echo "dirs ready"


echo "cloning repos"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	git clone ${erzakaz[repo]} ${erzakaz[localfolder]}
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	git clone ${erreestr[repo]} ${erreestr[localfolder]}
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	git clone ${ercommon[repo]} ${ercommon[localfolder]}
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	git clone ${erportal[repo]} ${erportal[localfolder]}
fi

if [ ${ersf[enable]} ]; then
	echo "ersf"
	git clone ${ersf[repo]} ${ersf[localfolder]}
fi
echo "cloned"