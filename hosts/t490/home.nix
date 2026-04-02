{config, pkgs, ...}:
{
 home.packages = with pkgs; [
     appimage-run
     alacritty
     fuzzel
];

  home.file.".config/niri/config.kdl".source = ../../modules/hm/niri/config.kdl;
















  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "26.05";



}

