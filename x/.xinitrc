#!/bin/sh

if [ -n $DBUS_SESSION_BUS_ADDRESS ]; then
    export $(dbus-launch)
fi

xrdb -merge $HOME/.Xresources &
xsetroot -cursor_name left_ptr &
xbacklight -set 80 &
picom --config $HOME/.config/picom.conf &
numlockx &
dunst &
urxvtd -q &
mpd --no-daemon &
$HOME/.scripts/ws &

session=${1:-2bwm}

case $session in
    2bwm            ) exec 2bwm;;
    berry           ) exec berry;;
    bspwm           ) exec bspwm;;
    *               ) exec $1;;
esac
