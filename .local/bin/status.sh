#!/bin/sh

# BACKGROUND=$(xrdb -query | grep background: | cut -f 2 | head -n1)
# COL1=$(xrdb -query | grep color1: | cut -f 2)
# COL3=$(xrdb -query | grep color3: | cut -f 2)
# COL6=$(xrdb -query | grep color6: | cut -f 2)

STATUSBAR() {
	# Time
	# dynamically set timezone?
	TIME=" $(date '+%a, %b %d, %4Y %I:%M%P %Z')"

	# Volume
	# remember last volume value when muted
	MIC=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
	[ $MIC = "yes" ] && MIC="" || MIC="  │"

	VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | head -1 | awk '{print $5;}' | sed 's/.$//')
	MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
	[ $VOLUME = 0 ] && VOLICON=
	[ $VOLUME -gt 0 ] && VOLICON=" "
	[ $VOLUME -ge 50 ] && VOLICON=" 󰕾"
	[ $VOLUME -gt 100 ] && VOLICON=" !󰕾"
	[ $MUTE = "yes" ] && VOLICON=" 󰖁"
	VOLUME="$MIC$VOLICON $VOLUME% "

	# Battery
	#         
	CAPACITY=$(cat /sys/class/power_supply/BAT?/capacity)
	if [ -z $CAPACITY ]; then
		BATTERY=""
	else
		[ $CAPACITY -ge 0 ] && CHARGE=󰂃
		[ $CAPACITY -ge 10 ] && CHARGE=󰁻
		[ $CAPACITY -ge 30 ] && CHARGE=󰁽
		[ $CAPACITY -ge 40 ] && CHARGE=󰁾
		[ $CAPACITY -ge 60 ] && CHARGE=󰂀
		[ $CAPACITY -ge 80 ] && CHARGE=󰂁
		[ $CAPACITY -gt 90 ] && CHARGE=󰁹
		UPOWER=$(cat /sys/class/power_supply/BAT*/status)
		[ "$UPOWER" = "Charging" ] && CHARGE="󰂄"
		BATTERY="│ $CHARGE $CAPACITY% "
	fi

	# Internet
	#  
	if grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null; then
		NET=" $(awk '/^\s*w/ { print "󰒢", int($3 * 100 / 70) "%" }' /proc/net/wireless) "
	elif grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null; then
		grep -xq '0x1003' /sys/class/net/w*/flags && NET=" 󰒢 " || NET=" ! "
	fi
	[ $(cat /sys/class/net/e*/operstate) = "up" ] && NET="  "

	# Memory
	MEMORY="  $(free -h | grep 'Mem' | awk '{ print $3 }') "

	# CPU TEMP
	#     
	CPU=$(sensors amdgpu-pci-0500 -u | grep temp1_input | awk '{ print $2 }' | sed 's/\..*//g')
	[ $CPU -ge 0 ] && CPUICON=" "
	[ $CPU -gt 45 ] && CPUICON=" "
	[ $CPU -gt 60 ] && CPUICON=" "
	[ $CPU -gt 65 ] && CPUICON=" "
	[ $CPU -gt 75 ] && CPUICON=" !"
	CPU="$CPUICON $CPU°C "

	# XSETROOT
	xsetroot -name "$VOLUME$BATTERY│$MEMORY│$CPU│$NET│$TIME "
}

#init bar on script start
STATUSBAR

while :; do
	t=1
	sleep $(($t - $(date +%s) % $t))
	STATUSBAR
done
