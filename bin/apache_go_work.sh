#!/bin/bash

echo "apache go work"
if [ ${erzakaz[enable]} ]; then
	echo "erzakaz"
	a2ensite ${erzakaz[servier_site_name]}
fi

if [ ${erreestr[enable]} ]; then
	echo "erreestr"
	a2ensite ${erreestr[servier_site_name]}
fi

if [ ${ercommon[enable]} ]; then
	echo "ercommon"
	a2ensite ${ercommon[servier_site_name]}
fi

if [ ${erportal[enable]} ]; then
	echo "erportal"
	a2ensite ${erportal[servier_site_name]}
fi

if [ ${eradmin[enable]} ]; then
	echo "eradmin"
	a2ensite ${eradmin[servier_site_name]}
fi

if [ ${ersf[enable]} ]; then
	echo "ersf"
	a2ensite ${ersf[servier_site_name]}
fi

if [ ${onupdate[enable]} ]; then
	echo "onupdate"
	a2dissite ${onupdate[servier_site_name]}
fi

echo "apache reload"

a2ensite onupdate
service apache2 reload

echo "apache works"