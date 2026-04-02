{config, pkgs, ...}:
{
 home.packages = with pkgs; [
     appimage-run
     alacritty
     fuzzel
];


















  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "26.05";



}

