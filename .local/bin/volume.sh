#!/bin/sh

vol=$(pamixer --get-volume)
volStatus=$(pamixer --get-volume-human)

if [ "$volStatus" = "muted" ]; then
	icon="^c#FEE56C^󰖁^c#FFFFFF^"
else
	icon="^c#FEE56C^VOL^c#FFFFFF^"
fi

printf "%s %s%%" "$icon" "$vol"
