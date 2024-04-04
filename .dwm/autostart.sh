#!/usr/bin/env zsh

killall udiskie
xrandr --auto
udiskie &

# Notifications
/usr/bin/dunst &
# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Wallpaper
nitrogen --restore &

# exec picom &
exec slstatus &
xset r rate 200 50
xinput set-prop 10 "libinput Accel Profile Enabled" 0 1 0
tmux new-session -ds "main" "zsh"
clipmenud &
nm-applet &
