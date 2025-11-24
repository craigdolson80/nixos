{ config, pkgs, ... }:

{
  # X11 / display stack
  services.xserver.enable = true;

  # Display manager / desktop environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Window managers
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.windowManager.qtile.enable = true;
  services.xserver.windowManager.qtile.extraPackages = p: with p; [ qtile-extras ];

  # Wayland compositors
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.sway.enable = true;

  # Graphics stack
  hardware.graphics.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Smart cards / tokens
  services.pcscd.enable = true;

  # DConf – needed by a lot of GTK / DE tooling
  programs.dconf.enable = true;

  # Trezor daemon
  services.trezord.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Audio via PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable        = true;
    alsa.enable   = true;
    alsa.support32Bit = true;
    pulse.enable  = true;
    # jack.enable = true; # Uncomment if you need JACK
  };

  # Thunar file manager & helpers
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  services.gvfs.enable   = true; # Mount, trash, etc.
  services.tumbler.enable = true; # Thumbnails

  # AppImage support
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
