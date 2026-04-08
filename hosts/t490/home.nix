{config, pkgs, ...}:
{

imports = [
	../../modules/hm/kitty.nix
    ../../modules/hm/programs.nix
    ../../modules/hm/zsh.nix
  ]; 


home.packages = with pkgs; [
     alacritty
     fuzzel

];

  home.file.".config/niri/config.kdl".source = ../../modules/hm/niri/config.kdl;





  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "26.05";



}

