#!/bin/bash

# This is a script to autostart some applications like picom
# or merge some Xresources or change the wallpaper, or in This
# case is necesary to start sxhkd

#  NOTE: This is an example file, you can change it with your stuff

xsetroot -cursor_name left_ptr
picom -b

# notification manager (I include configuration for dunst)
dunst &

# Wallpapers configuration (based in the selected theme)
source $HOME/.config/bspwm/wallpapers.sh
if ! test -f $HOME/.actual-theme; then
  echo catppuccin > $HOME/.actual-theme
fi
theme=$(cat $HOME/.actual-theme)
# this calls to the wallpaper function
wallpaper=$(wall_$theme)
feh --bg-fill $wallpaper

# don't remove this please
sxhkd &

# generate the updates
bash $HOME/.config/bspwm/scripts/gen-updates.sh &

# notify-send "Welcome Lord $USER"
