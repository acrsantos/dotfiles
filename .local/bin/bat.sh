#! /bin/bash

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 88 ]
then
    notify-send -u CRITICAL -t 6000 "Battery low" "Battery level is <b><span color='#ff0000'>${battery_level}%!</span></b>"
fi
