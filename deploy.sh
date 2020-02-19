#!/bin/sh

# Remove existing files to avoid conflicts
if [ -f ~/.bashrc ]; then
    rm -rf ~/.bashrc
fi

if [ -f ~/.bash_profile ]; then
    rm -rf ~/.bash_profile
fi

if [ -d ~/.config/cava ]; then
    rm -rf ~/.config/cava
fi

echo "Symlinking dotfiles..."
stow bash
stow bin
stow cava
stow picom
stow dunst
stow mpd
stow mpv
stow ncmpcpp
stow newsboat
stow oomox
stow ranger
stow rtorrent
stow scripts
stow vim
stow x
stow zathura
stow zenbu
echo "Finished!"
