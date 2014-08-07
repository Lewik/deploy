#!/bin/bash

if [ -z $1 ]; then
	echo "first argument must be release or debug"
	exit 1
elif [ $1 = "release" ]; then
	DIR=${srv_prod}
elif [ $1 = "debug" ]; then
    DIR=${srv_debug}
else
    echo "first argument must be release or debug"
    exit 1
fi

#change path to repos

ersf[localfolder]=${DIR}${ersf[localfolder]}
erzakaz[localfolder]=${DIR}${erzakaz[localfolder]}
erreestr[localfolder]=${DIR}${erreestr[localfolder]}
ercommon[localfolder]=${DIR}${ercommon[localfolder]}
erportal[localfolder]=${DIR}${erportal[localfolder]}


ROOT_PATH=$(cd $(dirname $0) && pwd);
if [ ${ersf[enable]} ]; then

	echo "update"
	
	cd ${ersf[localfolder]}

	echo "composer self-update"
	php ${composer} self-update
	echo "composer install"
	php ${composer} install

	echo "sf cache warmup"
	php app/console cache:warmup


	echo "database update"
	echo "apply ct-patch"
	php app/console ip:db:import-file -p
	echo "sf-migrations"
	php app/console doctrine:migrations:migrate -n
	echo "sf schema update"
	php app/console ip:db:schema-update
	echo "sf fixtures"
	php app/console doctrine:fixtures:load --append



	echo "install sf-assets to ct"
	if [ ${erzakaz[enable]} ]; then
		echo "erzakaz"
		mkdir -p ${erzakaz[localfolder]}${bundles_folder}
		php app/console assets:install ${erzakaz[localfolder]}${bundles_folder}
	fi

	if [ ${erreestr[enable]} ]; then
		echo "erreestr"
		mkdir -p ${erreestr[localfolder]}${bundles_folder}
		php app/console assets:install ${erreestr[localfolder]}${bundles_folder}
	fi

	if [ ${ercommon[enable]} ]; then
		echo "ercommon"
		mkdir -p ${ercommon[localfolder]}${bundles_folder}
		php app/console assets:install ${ercommon[localfolder]}${bundles_folder}
	fi

	if [ ${erportal[enable]} ]; then
		echo "erportal"
		mkdir -p ${erportal[localfolder]}${bundles_folder}
		php app/console assets:install ${erportal[localfolder]}${bundles_folder}
	fi

	if [ ${ersf[enable]} ]; then
		echo "ersf"
		php app/console assets:install
	fi
	
	echo "ready"
fi

cd ${ROOT_PATH}
