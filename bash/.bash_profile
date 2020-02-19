#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z "$DISPLAY" && $(tty) == '/dev/tty1'  ]] ; then
	exec startx -- -keeptty > ~/.xorg.log 2>&1
fi
