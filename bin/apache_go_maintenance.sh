#!/bin/bash

echo "apache go maintenance"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	a2dissite ${erzakaz[servier_site_name]}
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	a2dissite ${erreestr[servier_site_name]}
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	a2dissite ${ercommon[servier_site_name]}
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	a2dissite ${erportal[servier_site_name]}
fi

if [ ${eradmin[enable]} ]; then
	echo "eradmin"
	a2dissite ${eradmin[servier_site_name]}
fi


if [ ${ersf[enable]} ]; then
	echo "ersf"
	a2dissite ${ersf[servier_site_name]}
fi

if [ ${onupdate[enable]} ]; then
	echo "onupdate"
	a2ensite ${onupdate[servier_site_name]}
fi

echo "apache reload"

a2ensite onupdate
service apache2 reload

echo "apache on maintenance"