#!/bin/bash


source bin/settings.conf.sh

if [ -z $1 ]; then
	echo "first argument must be repo"
	exit 1
fi

if [ -z $2 ]; then
	echo "second argument must be branch"
	exit 1
fi


source bin/pull.sh $1 $2