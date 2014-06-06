#!/bin/bash

echo "apache go work"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	a2ensite ${erzakaz[site_server_name]}
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	a2ensite ${erreestr[site_server_name]}
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	a2ensite ${ercommon[site_server_name]}
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	a2ensite ${erportal[site_server_name]}
fi

if [ ${eradmin[enable]} ]; then
	echo "eradmin"
	a2ensite ${eradmin[site_server_name]}
fi

if [ ${ersf[enable]} ]; then
	echo "ersf"
	a2ensite ${ersf[site_server_name]}
fi

if [ ${onupdate[enable]} ]; then
	echo "onupdate"
	a2dissite ${onupdate[site_server_name]}
fi

echo "apache reload"

a2ensite onupdate
service apache2 reload

echo "apache works"