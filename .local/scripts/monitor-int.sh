#!/bin/bash
# Very simple script to turn external display off and internal display on
# Use case: just before disconnecting laptop from monitor

internal=eDP
external=HDMI-1-0

# Turn internal display on
xrandr --output ${internal} --auto

# Turn external display off
xrandr --output ${external} --off
