{ config, pkgs, ... }:
let
  user="craig";
in
{
  environment.systemPackages = with pkgs; [
    grim
    grimblast
    nwg-look
    pywal
    rofi-wayland
    slurp
    sway
    swaybg
    swayidle
    swaylock-effects
    swww
    waybar
    waypaper
    wdisplays
    wl-clipboard
    wlogout
    wlr-randr
    wofi
    wttrbar
    xdg-desktop-portal-hyprland

  ];
}
