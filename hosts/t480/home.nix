{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./modules/noctalia/noctalia.nix
    ./modules/niri/niri-config.nix
    ./modules/hm/gtk-theme.nix
    ./modules/hm/zsh.nix
    ./modules/hm/kitty.nix
    
  ];

  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
     appimage-run
     brave
     cava
     discord
     font-manager 
     geany
     glances
     htop
     keepassxc
     imagemagick
     libreoffice
     lxappearance
     signal-desktop
     sparrow
     telegram-desktop
     udiskie
     udisks
     veracrypt
     viewnior
     yubikey-agent
     yubikey-manager
     yubioath-flutter
     zsh-powerlevel10k

 #Themes
     dracula-theme
     dracula-icon-theme
     dracula-qt5-theme
     catppuccin-kde
     catppuccin
     catppuccin-cursors.mochaDark
  ];

}
