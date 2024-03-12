#!/bin/sh

timeswaylock=600
timeoff=1000
swayidle -w timeout $timeswaylock 'swaylock -f -i ~/github/wallpaper/065.jpg' timeout $timeoff 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
