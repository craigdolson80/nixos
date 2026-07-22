{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  imports = [
    ./modules/sys/fonts.nix
    ./modules/sys/syspkgs.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-8bad9c0c-e304-4d4b-9226-98b65cde8c9f".device =
    "/dev/disk/by-uuid/8bad9c0c-e304-4d4b-9226-98b65cde8c9f";

  # Firmware and BIOS updates through LVFS/fwupd
  services.fwupd.enable = true;

# Linux firmware blobs and Intel CPU microcode
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  # Garbage Collection
  nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 7d";
};   

  networking.hostName = "t480";
  networking.networkmanager.enable = true;
  # Tailscale
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "both";

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT    = "en_US.UTF-8";
    LC_MONETARY       = "en_US.UTF-8";
    LC_NAME           = "en_US.UTF-8";
    LC_NUMERIC        = "en_US.UTF-8";
    LC_PAPER          = "en_US.UTF-8";
    LC_TELEPHONE      = "en_US.UTF-8";
    LC_TIME           = "en_US.UTF-8";
  };


  # Niri Wayland compositor
  programs.niri.enable = true;

  # Noctalia shell/bar
  programs.noctalia.enable = true;
  programs.noctalia.systemd.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  xdg.portal = {
    enable = true;
  extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = [ "gtk" ];
  };

  # Keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Battery information service used by desktop shells
  services.upower.enable = true;

  services.printing.enable = true;
  hardware.bluetooth.enable = true;

  users.users.craig = {
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
    ];

    packages = with pkgs; [ ];
    shell    = pkgs.zsh;
  };

  # Shell configuration
  programs.zsh.enable = true;
  programs.zsh.promptInit =
    "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";


  

  # Example of pulling a package from unstable:
  # environment.systemPackages = [ pkgs-unstable.some-package ];

  environment.systemPackages = with pkgs; [];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
