{ config, pkgs, ... }:

let
  user="craig";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/sys/fonts.nix
      ../../modules/sys/vm.nix
      ../../modules/sys/polkit.nix
      ../../modules/sys/syspkgs.nix
      ../../modules/sys/hypr.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk=true;

  boot.initrd.luks.devices."luks-2e14c121-58b3-48ec-9f95-f84079d24a90".keyFile = "/crypto_keyfile.bin";
  networking.hostName = "opx-7010"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
  
  fileSystems."/home/craig/nfs" = {
    device = "qnap:/craig";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
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
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.windowManager.qtile.enable = true;
  programs.hyprland.enable  = true;
  programs.hyprland.xwayland.enable = true;
  programs.sway.enable = true;
  #services.xserver.windowManager.qtile.extraPackages = p: with p; [ qtile-extras ];

  # MISC Services to enable
  services.pcscd.enable = true;
  programs.dconf.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  services.onedrive.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  # Enable sound with pipewire.
  sound.enable = true;
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
    ];
    shell = pkgs.zsh;
  };

  #Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  system.stateVersion = "23.05";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

### HOME MANAGER MODULE - MOVED TO FLAKE ###
  
}
