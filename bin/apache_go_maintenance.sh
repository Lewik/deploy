#!/bin/bash

echo "apache go maintenance"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	a2dissite ${erzakaz[site_server_name]}
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	a2dissite ${erreestr[site_server_name]}
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	a2dissite ${ercommon[site_server_name]}
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	a2dissite ${erportal[site_server_name]}
fi

if [ ${eradmin[enable]} ]; then
	echo "eradmin"
	a2dissite ${eradmin[site_server_name]}
fi


if [ ${onupdate[enable]} ]; then
	echo "onupdate"
	a2ensite ${onupdate[site_server_name]}
fi

echo "apache reload"

a2ensite onupdate
service apache2 reload

echo "apache on maintenance"