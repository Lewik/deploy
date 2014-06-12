#!/bin/bash

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

	#database update
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
		php app/console assets:install ${erzakaz[localfolder]}${bundles_folder}
	fi

	if [ ${erreestr[enable]} ]; then
		echo "erreestr"
		php app/console assets:install ${erreestr[localfolder]}${bundles_folder}
	fi

	if [ ${ercommon[enable]} ]; then
		echo "ercommon"
		php app/console assets:install ${ercommon[localfolder]}${bundles_folder}
	fi

	if [ ${erportal[enable]} ]; then
		echo "erportal"
		php app/console assets:install ${erportal[localfolder]}${bundles_folder}
	fi

	if [ ${ersf[enable]} ]; then
		echo "ersf"
		php app/console assets:install
	fi
	
	echo "ready"
fi

cd ${ROOT_PATH}
