#!/bin/bash

source bin/settings.conf

if [ -z $1 ]; then
	echo "first argument must be repo"
	exit 1
fi

if [ -z $2 ]; then
	echo "second argument must be branch"
	exit 1
fi

source bin/apache_go_maintenance.sh
source bin/checkout.sh $2
source bin/pull.sh $1 $2
source bin/php_update.sh
source bin/chown.sh
source bin/apache_go_work.sh