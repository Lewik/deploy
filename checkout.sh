#!/bin/bash

source bin/settings.conf.sh


if [ -z $1 ]; then
	echo "first argument must be branch"
	exit 1
fi

source bin/checkout.sh $1