{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  imports = [
    ./modules/sys/fonts.nix
    ./modules/sys/syspkgs.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  # Firmware and BIOS updates through LVFS/fwupd
  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;

  # Garbage Collection
  nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 7d";
};  
  # DNS & search domain
  networking.nameservers = [
    "100.100.100.100"
    "1.1.1.1"
    "9.9.9.9"
  ];

  networking.hostName = "mainsys";
  networking.networkmanager.enable = true;

   networking.hosts = {
    "10.0.2.170" = [
      "umbrel"
      "umbrel.local"
    ];

    "10.0.0.10" = [
      "homemanager"
    ];

    "10.0.0.1" = [
      "opnsense"
      "opnsense.local"
    ];
  };

  # Tailscale
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "both";
  networking.search = [ "mainsys.tail72594.ts.net" ];

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

  # Niri Wayland compositor
  programs.niri.enable = true;

  # Password Manager
  programs._1password.enable = true;
  programs._1password-gui.enable = true;

  # Noctalia shell/bar
  programs.noctalia.enable = true;
  programs.noctalia.systemd.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  xdg.portal = {
    enable = true;
  extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = [ "gtk" ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Virtualbox Components
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Udev rules for hardware wallets
  services.udev.packages = with pkgs; [
    ledger-udev-rules
    trezor-udev-rules
  ];

  # Clear NTFS dirty flag on plug-in so udisks2 can automount
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="ntfs|ntfs-3g", \
      RUN+="${pkgs.ntfs3g}/bin/ntfsfix -d /dev/%k"
  '';

  # Allow udisks2 to mount NTFS volumes even if dirty flag remains
  environment.etc."udisks2/mount_options.conf".text = ''
    [defaults]
    ntfs_defaults=uid=$UID,gid=$GID,nofail,remove_hiberfile
    ntfs3_defaults=uid=$UID,gid=$GID,nofail,force
  '';
  
  # PCSCD service for yubikey
  services.pcscd.enable = true;

  # nix-ld for running unpatched dynamic binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      openssl
      zlib
      pcsclite
      libusb1
      libxcb
    ];
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."craig" = {
    isNormalUser = true;
    description = "Craig Olson";
      extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "lpd"
      "libvirtd"
      "users"
      "ntfsuser"
      "fuse"
      "vboxusers"
    ];
 
    packages = with pkgs; [ ];
    shell    = pkgs.zsh;
  };

    # Shell configuration
  programs.zsh.enable = true;
  programs.zsh.promptInit =
    "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  environment.systemPackages = with pkgs; [];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
