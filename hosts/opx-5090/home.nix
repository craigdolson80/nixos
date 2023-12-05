{config, pkgs, ...}:

{
  
  imports = [
    ../../modules/hm/zsh.nix
    ../../modules/hm/kitty.nix
    ../../modules/hm/github.nix
    ../../modules/hm/programs.nix
    ../../modules/hm/ssh.nix
    ../../modules/hm/vscode.nix
    home-manager/apps/bspwm.nix
    home-manager/apps/sxhkd.nix
  ];

  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "23.05";
  
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    cursorTheme.name = "Dracula-cursors";
    iconTheme.name = "Dracula";
    };

#Default MIME Types
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["okularApplication_pdf.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["okularApplication_pdf.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
    };
  };  
 
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
     source = ../../modules/hm/commonfiles/picom;
     };
  #rofi
     home.file.".config/rofi" = {
     source = ../../modules/hm/commonfiles/rofi;
     recursive = true;
     executable = true;
     };
  #hyprland
     home.file.".config/hypr" = {
     source = home-manager/dotfiles/hypr;
     recursive = true;
     executable = true;
     };
  #waybar
     home.file.".config/waybar" = {
     source = home-manager/dotfiles/waybar;
     recursive = true;
     executable = true;
     };   
  #swaylock
     home.file.".swaylock/" = {
     source = home-manager/dotfiles/swaylock;
     recursive = true;
     executable = true;
     }; 
   #swayidle
     home.file."swayidle/" = {
     source = home-manager/dotfiles/swayidle;
     recursive = true;
     executable = true;
     };  
  #wlogout
     home.file.".config/wlogout" = {
     source = home-manager/dotfiles/wlogout;
     recursive = true;
     executable = true;
     };
  #neofetch
     home.file.".config/neofetch" = {
     source = home-manager/dotfiles/neofetch;
     recursive = true;
     executable = true;
     };       
    
}
