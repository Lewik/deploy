#!/bin/bash

ROOT_PATH=$(cd $(dirname $0) && pwd);
echo "get via scp"

#создаем и очищаем папку для архива
mkdir -pv ${scp_folder}
cd ${scp_folder}
rm -rf *

#скачиваем архив
scp -P ${scp_port} ${scp_user}@${scp_address}:${scp_pattern} ${scp_folder}

#получить имя архива
cd ${scp_folder}

for file in ./*; do
  ZIP=${file##*/}
  break
done

FILE=${ZIP%.*}

#извлечение данных
unzip -x $ZIP

#переместить в Debug & Release
rm -rf $FILE/ersf/vendor

mkdir -pv ${srv_debug}
cp -av $FILE/* ${srv_debug}
mkdir -pv ${srv_prod}
cp -av $FILE/* ${srv_prod}

rm -rf ${scp_folder}

echo "+%Y-%m-%d %H:%M:%S Downloaded "${ZIP} >> scp_log

echo "ready"
cd ${ROOT_PATH}
