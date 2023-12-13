{config, pkgs, ...}:

let
  user="craig";
in

{
   

#DOTFILE IMPORTS
  #qtile
     home.file.".config/qtile" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/qtile;
     recursive = true;
     };

     home.file.".config/polybar" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/polybar;
     recursive = true;
     executable = true;
     };
   #picom
     home.file.".config/picom" = {
     source = commonfiles/picom;
     };
  #rofi
     home.file.".config/rofi" = {
     source = commonfiles/rofi;
     recursive = true;
     executable = true;
     };
  #hyprland
     home.file.".config/hypr" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/hypr;
     recursive = true;
     executable = true;
     };
  #waybar
     home.file.".config/waybar" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/waybar;
     recursive = true;
     executable = true;
     };   
  #swaylock
     home.file.".swaylock/" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/swaylock;
     recursive = true;
     executable = true;
     }; 
   #swayidle
     home.file."swayidle/" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/swayidle;
     recursive = true;
     executable = true;
     };  
  #wlogout
     home.file.".config/wlogout" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/wlogout;
     recursive = true;
     executable = true;
     };
  #neofetch
     home.file.".config/neofetch" = {
     source = /home/${user}/nixos/hosts/opx-5090/home-manager/dotfiles/neofetch;
     recursive = true;
     executable = true;
     };    

}