{ config, pkgs, ... }:
let
  user="craig";
in
{
  environment.systemPackages = with pkgs; [
    waybar
    sway
    swaylock
    hyprpaper
    xdg-desktop-portal-hyprland
    wofi
    nwg-look

  ];
}
