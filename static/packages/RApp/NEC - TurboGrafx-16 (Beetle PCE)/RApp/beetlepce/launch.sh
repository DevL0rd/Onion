#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`
homedir=`dirname "$1"`

MODEL_MM=283
MODEL_MMWIFI=696
MODEL_MMP=354

# if 283 or wifi mod
if [ "$(cat /tmp/deviceModel)" -eq $MODEL_MM ] || [ "$(cat /tmp/deviceModel)" -eq $MODEL_MMWIFI ]; then
	echo -n 1600 >"/mnt/SDCARD/Saves/CurrentProfile/config/Beetle PCE/cpuclock.txt" #  Miyoo Mini
else
	echo -n 1900 >"/mnt/SDCARD/Saves/CurrentProfile/config/Beetle PCE/cpuclock.txt" #  Miyoo Mini Plus
fi

cd /mnt/SDCARD/RetroArch/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/../../RetroArch/.retroarch/cores/mednafen_pce_libretro.so "$1"
