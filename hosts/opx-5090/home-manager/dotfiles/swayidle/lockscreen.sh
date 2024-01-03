#!/bin/sh

timeswaylock=300
timeoff=360
swayidle -w timeout $timeswaylock 'swaylock -f -i ~/github/wallpaper/065.jpg' timeout $timeoff 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
