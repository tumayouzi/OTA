#!/bin/bash

# common
version=3.0
romtype=Official
gapps="https://opengapps.org/"

# maintainer info
user="tumayouzi" # SourceForge username. required
maintainer="tumayouzi" # required
paypal="" # optional. ex: https://www.paypal.me/hotatech
telegram="http://bit.ly/hellofloko" # If you are not using Telegram, Discord is ok

# device-specific info (this is example. you should write like this)
case $1 in
guacamoleb) # codename
	oem="OnePlus" # manufacturer
	devicename="OnePlus 7" # device name
	forum="https://forum.xda-developers.com/oneplus-7/development/rom-flokorom-v3-0-t4093225" # xda link if exist
	recovery="https://sourceforge.net/projects/mauronofrio-twrp/" # recommended recovery
	# and you can link recommended *modem* and *bootloader* here
	;;
evert) # codename
	oem="Motorola" # manufacturer
	devicename="Moto G6 Plus" # device name
	forum="https://forum.xda-developers.com/g6-plus/development/rom-flokorom-v3-0-t4069063" # xda link if exist
	recovery="https://dl.twrp.me/evert/" # recommended recovery
	# and you can link recommended *modem* and *bootloader* here
	;;
esac
