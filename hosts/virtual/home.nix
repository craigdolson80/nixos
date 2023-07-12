{config, pkgs, ...}:

{
  
  imports = [
    home-manager/apps/zsh.nix
    home-manager/apps/bspwm.nix
    home-manager/apps/sxhkd.nix
    home-manager/apps/kitty.nix
    home-manager/apps/github.nix
    home-manager/apps/programs.nix
    home-manager/apps/ssh.nix
    home-manager/apps/vscode.nix
  ];

  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "23.05";
  
 
#Services 
  services.dunst.enable = true;
  nixpkgs.config.allowUnfree = true;

#DOTFILE IMPORTS
  #qtile
     home.file.".config/qtile" = {
     source = home-manager/dotfiles/qtile;
     recursive = true;
     };
  #polybar
     home.file.".config/polybar" = {
     source = home-manager/dotfiles/polybar;
     recursive = true;
     executable = true;
     };
   #picom
     home.file.".config/picom" = {
     source = home-manager/dotfiles/picom;
     };
  #rofi
     home.file.".config/rofi" = {
     source = home-manager/dotfiles/rofi;
     recursive = true;
     executable = true;
     };
}
