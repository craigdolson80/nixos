{config, pkgs, ...}:
{

imports = [
    ./modules/niri/niri-config.nix
	  ../../modules/hm/kitty.nix
    ../../modules/hm/programs.nix
    ../../modules/hm/zsh.nix
    ../../modules/hm/github.nix
    ../../modules/hm/ssh.nix
    ../../modules/hm/vscode.nix
  ]; 


home.packages = with pkgs; [
     alacritty
     fuzzel

];

  home.file.".config/cava/config".source = home-manager/dotfiles/cava/config;





  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "26.05";



}

