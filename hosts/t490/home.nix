{config, pkgs, ...}:
{

imports = [
	../../modules/hm/kitty.nix
        ../../modules/hm/programs.nix
  ]; 


home.packages = with pkgs; [
     alacritty
     fuzzel
     kitty
];

  home.file.".config/niri/config.kdl".source = ../../modules/hm/niri/config.kdl;





  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "26.05";



}

