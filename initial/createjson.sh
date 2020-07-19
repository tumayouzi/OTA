#!/bin/bash
# put script in FlokoROM source folder, make executable (chmod +x createupdate.sh) and run it (./createupdate.sh)

# modify values below, leave blank if not used
maintainer="Name (nickname)" # ex: hota (lindwurm)
oem="manufacturer" # ex: Xiaomi
device="device codename" # ex: clover
devicename="name of device" # ex: Mi Pad 4
zip="FlokoROM zip" # ex: Floko-v3.0-clover-20200713_063400-OFFICIAL.zip
buildtype="OFFICIAL" # Choose from Official/Experimental/Unofficial
forum="" # ex: https://forum.xda-developers.com/mi-pad-4/development/rom-flokorom-v3-0-t4081807
gapps="https://opengapps.org"
firmware=""
modem=""
bootloader=""
recovery="" # ex: https://dl.twrp.me/clover/
paypal="" # ex: https://paypal.me/hotatech
telegram="" # also discord is ok. ex: http://bit.ly/hellofloko

#don't modify from here
script_path="`dirname \"$0\"`"
zip_name=$script_path/out/target/product/$device/$zip

build_date=`echo "$zip_name" | cut -d'-' -f3 | cut -d'_' -f1`
zip_date=`date -r $zip_name "+%Y%m%d %H:%M:%S"`
timestamp=`date --date="$zip_date" +%s`
zip_only=`basename "$zip_name"`
md5=`echo "$zip_name" | md5sum | cut -d' ' -f1`
size=`stat -c "%s" "$zip_name"`

echo '{
  "response": [
    {
        "maintainer": "'$maintainer'",
        "oem": "'$oem'",
        "device": "'$devicename'",
        "filename": "'$zip_only'",
        "download": "https://sourceforge.net/projects/flokorom/files/v3/'$device'/'$zip_only'/download",
        "timestamp": '$timestamp',
        "md5": "'$md5'",
        "size": '$size',
        "buildtype": "'$buildtype'",
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
}' >> $device.json
