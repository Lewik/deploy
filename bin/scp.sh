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
echo "Unzipping..."
unzip -qx $ZIP
mv $ZIP ${scp_archive}
rm -rf $FILE/ersf/vendor

echo "Unzipping done!"

echo "ready"
cd ${ROOT_PATH}
