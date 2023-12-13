{config, pkgs, ...}:

let
  user="craig";
in

{
   

#DOTFILE IMPORTS
  #qtile
     home.file.".config/qtile" = {
     source = /home/"${user}"/nixos/hosts/opx5090/home-manager/dotfiles/qtile;
     recursive = true;
     };

}