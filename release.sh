#!/bin/bash

echo "FlokoROM release uploader"

if [ $# -lt 2 ]; then
        echo -e "\nUsage: $CMDNAME [target_device] [file_name]\n" 1>&2
        exit 1
fi

device=$1
file=$2

if [ -f "config.sh" ]; then
        source "config.sh" "$1"
else
        echo -e "There is no config file. \n"
        echo -e "`cp config.sh.example config.sh` and edit it \n"
	exit 1
fi

rsync -avP -e ssh ${file} ${user}@frs.sourceforge.net:/home/frs/project/flokorom/v3/${device}

echo -e "upload is done! generate json..."

datetime=$(date --date="$(date -r $file "+%Y%m%d %H:%M:%S")" +%s)
id=$(echo $file | md5sum | cut -d' ' -f1)
size=$(stat -c "%s" $file)
filename=$(basename $file)

echo '{
  "response": [
    {
        "maintainer": "'$maintainer'",
        "oem": "'$oem'",
        "device": "'$device'",
        "filename": "'$filename'",
        "download": "https://sourceforge.net/projects/flokorom/files/v3/'$device'/'$filename'/download",
        "timestamp": '$datetime',
        "md5": "'$id'",
        "size": '$size',
        "version": "'$version'",
        "buildtype": "'$romtype'",
        "forum": "'$forum'",
        "gapps": "'$gapps'",
        "firmware": "'$firmware'",
        "modem": "'$modem'",
        "bootloader": "'$bootloader'",
        "recovery": "'$recovery'",
        "paypal": "'$paypal'",
        "telegram": "'$telegram'"
    }
  ]
}' > devices/${device}.json

echo -e "devices/${device}.json is successfully generated!"
