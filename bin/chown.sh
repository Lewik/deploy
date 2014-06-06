#!/bin/bash

echo "chown"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	cd ${erzakaz[localfolder]}
	chown www-data:www-data -R *
fi
if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	cd ${erreestr[localfolder]}
	chown www-data:www-data -R *
fi
if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	cd ${ercommon[localfolder]}
	chown www-data:www-data -R *
fi
if [ ${erportal[enable]} ]; then
	echo "erportal"
	cd ${erportal[localfolder]}
	chown www-data:www-data -R *
fi
if [ ${ersf[enable]} ]; then
	echo "ersf"
	cd ${ersf[localfolder]}
	chown www-data:www-data -R *
fi

echo "chown ok"