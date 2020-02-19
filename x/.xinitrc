#!/bin/sh
xrdb -merge $HOME/.Xresources &
xsetroot -cursor_name left_ptr &
xbacklight -set 80 &
picom --config $HOME/.config/picom.conf -b &
numlockx &
dunst &
urxvtd -q &
mpd --no-daemon &
$HOME/.scripts/ws &
bar &

session=${1:-2bwm}

case $session in
    2bwm            ) exec 2bwm;;
    *               ) exec $1;;
esac
