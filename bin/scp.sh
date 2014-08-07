#!/bin/bash

ROOT_PATH=$(cd $(dirname $0) && pwd);
echo "Get via scp"

echo "Prepare scp buffer folder"
mkdir -pv ${scp_folder}
cd ${scp_folder}
rm -rf *

echo "Download zip-archive"
scp -P ${scp_port} ${scp_user}@${scp_address}:${scp_pattern} ${scp_folder}


cd ${scp_folder}

for file in ./*; do
  ZIP=${file##*/}
  break
done

FILE=${ZIP%.*}

echo "Zip name: ${ZIP}"


echo "Unzipping..."
unzip -qx $ZIP
echo "Unzipping done"

echo "Moving $ZIP file to archive"
mkdir -pv ${scp_archive}
mv $ZIP ${scp_archive}

echo "Preparing downloaded update"
rm -rf $FILE/ersf/vendor
chown -R web_server_user:web_server_group $FILE

echo "ready"
cd ${ROOT_PATH}
