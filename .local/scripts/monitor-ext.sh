#!/bin/bash
# Very simple script to turn external display on and internal display off
# Use case: when connecting laptop to external monitor

internal=eDP
external=HDMI-1-0

# Turn external display on
xrandr --output ${external} --auto

# Turn internal display off
xrandr --output ${internal} --off
