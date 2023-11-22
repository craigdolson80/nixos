{ config, pkgs, ... }:
let
  user="craig";
in
{
  environment.systemPackages = with pkgs; [
    waybar
    sway
    swaylock
    swaylock-effects
    swayidle
    hyprpaper
    xdg-desktop-portal-hyprland
    wofi
    nwg-look
    wlogout
    rofi-wayland

  ];
}
