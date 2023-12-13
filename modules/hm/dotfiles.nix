{config, pkgs, ...}:

{


home.username = "craig";
home.homeDirectory = "/home/craig";
home.stateVersion = "23.05";

#DOTFILE IMPORTS
  #qtile
     home.file.".config/qtile" = {
     source = home-manager/dotfiles/qtile;
     recursive = true;
     };

}