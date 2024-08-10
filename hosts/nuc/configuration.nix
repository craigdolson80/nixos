# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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

  boot.initrd.luks.devices."luks-9ed26e31-72b2-410e-b66b-7f41485b6cc7".device = "/dev/disk/by-uuid/9ed26e31-72b2-410e-b66b-7f41485b6cc7";
  networking.hostName = "nuc"; # Define your hostname.
#  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.



  # Enable networking
  networking.networkmanager.enable = true;

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
#  environment.systemPackages = [ pkgs.cifs-utils ];
#  fileSystems."/home/craig/synology" = {
#    device = "//100.84.38.63/craig";
#    fsType = "cifs";
#    options = let
      # this line prevents hanging on network split
#      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

#    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
#  };
   
    
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
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
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
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # User Config
  users.users.craig = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "lpd" "libvirtd" "users" ];
    packages = with pkgs; [
    # firefox
      git
      neovim
      vim
      meld
    ];
    shell = pkgs.zsh;
  };

  #Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  #Set shell
  programs.zsh.enable = true;
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  system.stateVersion = "23.05";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

### HOME MANAGER MODULE - MOVED TO FLAKE ###
  
}
