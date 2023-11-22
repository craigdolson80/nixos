#!/bin/sh

timeswaylock=300
timeoff=420
swayidle -w timeout $timeswaylock 'swaylock -f -i ~/github/wallpaper/096.jpg' timeout $timeoff 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
