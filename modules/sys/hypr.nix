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
    swww
    waypaper
    hyprpaper
    xdg-desktop-portal-hyprland
    wofi
    nwg-look
    wlogout
    rofi-wayland
    grim
    grimblast
    slurp
    wl-clipboard
    pywal
    wttrbar
    swaybg
    wlr-randr
    wdisplays

  ];
}
