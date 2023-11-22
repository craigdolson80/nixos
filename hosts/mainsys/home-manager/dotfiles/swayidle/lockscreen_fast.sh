#!/bin/sh


timeoff=30
swaylock -f -i '~/github/wallpaper/096.jpg' timeout $timeoff 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
