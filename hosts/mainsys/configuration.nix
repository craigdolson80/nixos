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
  #boot.supportedFilesystems = [ "nfs" ];

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-93e656e6-7c35-4c9e-9de4-0192c77c1b2c".device = "/dev/disk/by-uuid/93e656e6-7c35-4c9e-9de4-0192c77c1b2c";
  boot.initrd.luks.devices."luks-93e656e6-7c35-4c9e-9de4-0192c77c1b2c".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "mainsys"; # Define your hostname.
  
  # Enable networking
  networking.networkmanager.enable = true;
  services.sshd.enable = true;
  services.rpcbind.enable = true;
  #networking.wireless.enable = true;
  networking.hosts = {
  "10.0.1.2" = [ "synology" ];
  };

 # Enable Tailscale
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "both";
  networking.nameservers = [ "100.100.100.100" "8.8.8.8" "1.1.1.1" ];
  networking.search = [ "tail72594.ts.net" ];
  
  # NAS Connect
  #fileSystems."/home/${user}/nfs" = {
  #  device = "synology:/volume1/${user}";
  #  fsType = "nfs";
  #  options = [ "x-systemd.automount" "noauto" ];
  #};

 # Mount SMB / CIFS 
  fileSystems."/home/craig/nfs" = {
  device = "//synology/craig";
  fsType = "cifs";
  options = [ "username=craig" "password=10dollarz2mucH" "x-systemd.automount" "noauto" ];

3

      
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
    # KDE Plasma
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
    # Gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
    # Window Managers
  services.xserver.windowManager.bspwm.enable = true;
  #services.xserver.windowManager.qtile.enable = true;
  #services.xserver.windowManager.qtile.extraPackages = p: with p; [ qtile-extras ];
  programs.hyprland.xwayland.enable = true;
  programs.sway.enable = true;
  

  # MISC Services to enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.pcscd.enable = true;
  programs.dconf.enable = true;
  services.trezord.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  };
  services.onedrive.enable = true;
  virtualisation.podman.enable = true;
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.craig = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "lpd" "libvirtd" "users" ];
    packages = with pkgs; [
     #firefox
    ];
    shell = pkgs.zsh;
  };

#  environment.sessionVariables.NIXOS_OZONE_WL = "1";
 
  #Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  #Set shell
  programs.zsh.enable = true;
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

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
