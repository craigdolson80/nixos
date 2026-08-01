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
in
{
  environment.systemPackages = with pkgs; [
    alacritty
    appimage-run
    bat
    bind
    brightnessctl
    claude-code
    curl
    eza
    fastfetch
    fuzzel
    git
    gnupg
    grim
    gvfs
    inetutils
    ivpn
    killall
    kitty
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
    vim
    vimPlugins.catppuccin-nvim
    vimPlugins.catppuccin-vim
    vimPlugins.dracula-nvim
    vimPlugins.dracula-vim
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
  ];
}
