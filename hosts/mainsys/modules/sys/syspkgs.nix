{ config, pkgs, pkgs-unstable, inputs, ... }:

let
  user = "craig";

  ledgerLive = pkgs.writeShellScriptBin "ledger-live" ''
    exec ${pkgs.appimage-run}/bin/appimage-run \
      "/home/${user}/Applications/Ledger.AppImage"
  '';

  trezorSuite = pkgs.writeShellScriptBin "trezor-suite" ''
    exec ${pkgs.appimage-run}/bin/appimage-run \
      "/home/${user}/Applications/Trezor.AppImage"
  '';

  satochipUtils = pkgs.writeShellScriptBin "satochip-utils" ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.zlib ]}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
    exec "/home/${user}/Applications/satochip/satochip-utils" "$@"
  '';

  radarOmega = pkgs.writeShellScriptBin "RadarOmega" ''
   exec ${pkgs.appimage-run}/bin/appimage-run \
     "/home/${user}/Applications/RadarOmega.AppImage"
  '';

  ledgerLiveDesktop = pkgs.makeDesktopItem {
    name = "ledger-live";
    desktopName = "Ledger Live";
    genericName = "Cryptocurrency Wallet";
    comment = "Manage Ledger hardware wallets";
    exec = "${ledgerLive}/bin/ledger-live";
    terminal = false;
    categories = [ "Finance" ];
    keywords = [ "Ledger" "Wallet" "Bitcoin" "Crypto" ];
  };

  trezorSuiteDesktop = pkgs.makeDesktopItem {
    name = "trezor-suite";
    desktopName = "Trezor Suite";
    genericName = "Cryptocurrency Wallet";
    comment = "Manage Trezor hardware wallets";
    exec = "${trezorSuite}/bin/trezor-suite";
    terminal = false;
    categories = [ "Finance" ];
    keywords = [ "Trezor" "Wallet" "Bitcoin" "Crypto" ];
  };

  satochipUtilsDesktop = pkgs.makeDesktopItem {
    name = "satochip-utils";
    desktopName = "Satochip Utils";
    genericName = "Hardware Wallet Manager";
    comment = "Manage Satochip hardware wallets";
    exec = "${satochipUtils}/bin/satochip-utils";
    icon = "application-x-executable";
    terminal = false;
    categories = [ "Finance" "Utility" ];
    keywords = [ "Satochip" "Wallet" "Bitcoin" "Crypto" ];
  };

  radarOmegaDesktop = pkgs.makeDesktopItem {
    name = "radaromega";
    desktopName = "Radar Omega";
    genericName = "Weather Radar";
    comment = "View live weather radar";
    exec = "${radarOmega}/bin/RadarOmega";
    terminal = false;
    categories = [ "Science" "Utility" ];
    keywords = [ "Weather" "Radar" ];
  };
in
{
  environment.systemPackages = with pkgs; [
    alacritty
    appimage-run
    bat
    bind
    brightnessctl
    curl
    eza
    fuzzel
    git
    gnupg
    grim
    gvfs
    hplip
    inetutils
    ivpn
    killall
    libvlc
    logitech-udev-rules
    meld
    neovim
    nfs-utils
    ntfs3g
    openssl_4_0
    pavucontrol
    playerctl
    slurp
    thunar
    traceroute
    trash-cli
    trayscale
    vscode
    wget
    wl-clipboard
    xdg-utils
    xwayland-satellite

    ## Virtual Support Packages ##
    distrobox
    podman-desktop
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    win-spice
    virtio-win
    ## ------------------------ ##

    ccid
    lm_sensors
    pciutils
    pcsclite
    pcsc-tools
    usbutils

    ## System Themes ##
    catppuccin-gtk

    ## AppImage applications ##
    ledgerLive
    ledgerLiveDesktop

    trezorSuite
    trezorSuiteDesktop

    satochipUtils
    satochipUtilsDesktop

    radarOmega
    radarOmegaDesktop
  ];
}
