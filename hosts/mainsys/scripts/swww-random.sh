#!/bin/sh

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/github/wallpaper"

# Get a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the selected wallpaper using swww
swww img "$WALLPAPER"

