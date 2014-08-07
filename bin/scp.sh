#!/bin/bash

ROOT_PATH=$(cd $(dirname $0) && pwd);
echo "get via scp"

#scp buffer folder
mkdir -pv ${scp_folder}
cd ${scp_folder}
rm -rf *

#download zip-archive
scp -P ${scp_port} ${scp_user}@${scp_address}:${scp_pattern} ${scp_folder}

#zip-archiwve name
cd ${scp_folder}

for file in ./*; do
  ZIP=${file##*/}
  break
done

FILE=${ZIP%.*}


echo "Unzipping..."
unzip -qx $ZIP
mv $ZIP ${scp_archive}
rm -rf $FILE/ersf/vendor
echo "Unzipping done!"

#сохранение в архив
mkdir -pv ${scp_archive}
mv $ZIP ${scp_archive}
echo "$ZIP file moved to archive"

echo "ready"
cd ${ROOT_PATH}
