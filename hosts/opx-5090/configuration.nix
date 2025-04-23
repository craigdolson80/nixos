{ config, pkgs, ... }:

let
  user="craig";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include modules
      ../../modules/sys/fonts.nix
      ../../modules/sys/vm.nix
      ../../modules/sys/polkit.nix
      ../../modules/sys/syspkgs.nix
      ../../modules/sys/hypr.nix
      ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-d64fa5d6-bcbc-4582-97f4-2362aabb7a72".device = "/dev/disk/by-uuid/d64fa5d6-bcbc-4582-97f4-2362aabb7a72";
  boot.initrd.luks.devices."luks-d64fa5d6-bcbc-4582-97f4-2362aabb7a72".keyFile = "/crypto_keyfile.bin";
  
  # Additional Boot Variables
  boot.initrd.systemd.network.wait-online.enable = false;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "opx-5090"; # Define your hostname.


  # Enable networking
  networking.networkmanager.enable = true;
  networking.hosts = {
  "172.17.2.25" = [ "qnap" ];
  };

   # Enable Tailscale
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";
  networking.nameservers = [ "100.100.100.100" "8.8.8.8" "1.1.1.1" ];
  networking.search = [ "tail72594.ts.net" ];
  
#  fileSystems."/home/craig/nfs" = {
#    device = "qnap:/craig";
#    fsType = "nfs";
#    options = [ "x-systemd.automount" "noauto" ];
#
#  };

# # Enable SMB Share
   
  # For mount.cifs, required unless domain name resolution is not needed.
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/home/craig/synology" = {
    device = "//100.84.38.63/craig";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
   
    
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.windowManager.qtile.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.enable = true;
  programs.sway.enable = true;
  services.xserver.windowManager.qtile.extraPackages = p: with p; [ qtile-extras ];

  # MISC Services to enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.pcscd.enable = true;
  programs.dconf.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  # services.onedrive.enable = true;
  virtualisation.podman.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # NixOS has built-in modules to enable 1Password
  # along with some pre-packaged configuration to make
  # it work nicely. You can search what options exist
  # in NixOS at https://search.nixos.org/options

  # Enables the 1Password CLI
  programs._1password = { enable = true; };

  # Enables the 1Password desktop app
  programs._1password-gui = {
  enable = true;
  # this makes system auth etc. work properly
  polkitPolicyOwners = [ "craig" ];
  };
  
  # User Config
  users.users.craig = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "lpd" "libvirtd" "users" ];
    packages = with pkgs; [
    # firefox
    ];
    shell = pkgs.zsh;
  };

#  environment.sessionVariables.NIXOS_OZONE_WL = "1";
 
  #Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  #Set shell
  programs.zsh.enable = true;
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  #Set File Manager Options
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
     ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  #Overlays
  nixpkgs.overlays = [ (import ../../overlays/flameshot-overlay.nix) ];

  #Enable Hyprland & Supporting Apps
  #programs.hyprland.enable = true;
  #programs.waybar.enable = true;
  #programs.hyprland.xwayland.enable = true;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  

### HOME MANAGER MODULE - MOVED TO FLAKE ###
  
}
