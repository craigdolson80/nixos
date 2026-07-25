#!/usr/bin/env sh

sed '/^#/d;/^[[:space:]]*$/d' ~/.config/niri/dms/keybindings.md \
  | fuzzel --dmenu --prompt "Niri keybindings"
