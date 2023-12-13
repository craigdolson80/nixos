{config, pkgs, ...}:

{
  
  imports = [
    ../../modules/hm/zsh.nix
    ../../modules/hm/kitty.nix
    ../../modules/hm/github.nix
    ../../modules/hm/programs.nix
    ../../modules/hm/ssh.nix
    ../../modules/hm/vscode.nix
    ../../modules/hm/mime.nix
    ../../modules/hm/dotfiles.nix
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
 
#Services 
  services.dunst.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Programs with options (removed from programs.nix)

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
      vim_keys = true;
      theme_background = false;
      show_uptime = true;
      temp_scale = "fahrenheit";
    };
  };

}

