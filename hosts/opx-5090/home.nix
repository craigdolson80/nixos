{config, pkgs, ...}:

{
  
  imports = [
    #inputs.hyprland.homeManagerModules.default
    #./nix/hypr # points to ./nix/hypr/default.nix
    #./nix/waybar/waybar.nix
    ../../modules/hm/zsh.nix
    ../../modules/hm/kitty.nix
    ../../modules/hm/github.nix
    ../../modules/hm/programs.nix
    ../../modules/hm/ssh.nix
    ../../modules/hm/vscode.nix
    ../../modules/hm/mime.nix
    ../../modules/hm/gtk-theme.nix
    home-manager/apps/bspwm.nix
    home-manager/apps/sxhkd.nix
  ];

  home.username = "craig";
  home.homeDirectory = "/home/craig";
  home.stateVersion = "23.05";

#Creating Desktop Entries Rofi can present
  xdg.desktopEntries.Ledger = {
     name = "Ledger Live";
     genericName = "Ledger Live";
     exec = "ledger.sh";
     icon = "/home/craig/nixos/modules/icons/Ledger.png";
     terminal = false;
  };
  xdg.desktopEntries.Trezor = {
     name = "Trezor Suite";
     genericName = "Trezor Suite";
     exec = "trezor.sh";
     icon = "/home/craig/nixos/modules/icons/Trezor.png";
     terminal = false;
  };
  xdg.desktopEntries.Beeper = {
     name = "Beeper";
     genericName = "Beeper";
     exec = "beeper.sh";
     icon = "/home/craig/nixos/modules/icons/Beeper.png";
     terminal = false;
  };   
 
#Services 
  services.dunst.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Programs with options (removed from programs.nix)

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
      vim_keys = true;
      theme_background = false;
      show_uptime = true;
      temp_scale = "fahrenheit";
      net_iface = "enp0s31f6";
    };
  };

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

