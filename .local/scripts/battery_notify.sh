#!/bin/bash

BATTERY_PERCENTAGE=$(cat /sys/class/power_supply/BAT0/capacity)
CABLE_PLUGGED=$(cat /sys/class/power_supply/BAT0/status)
if [[ $CABLE_PLUGGED == 'Charging' ]]; then
    if [[ $BATTERY_PERCENTAGE -gt 80 ]]; then
        notify-send --urgency=critical "Battery optimization" "Battery reached 80%, unplug the power cable to optimize battery life." --icon "battery-good-charging-symbolic"
    fi
else
    if [[ $BATTERY_PERCENTAGE -lt 30 ]]; then
        notify-send --urgency=critical "Battery optimization" "Battery is below 30%, plug in the power cable to optimize battery life." --icon "battery-low-symbolic"
    fi
fi
