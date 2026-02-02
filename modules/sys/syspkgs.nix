{ config, pkgs, ... }:
let
  user="craig";
in
{
  environment.systemPackages = with pkgs; [
    bat
#   bridge-utils #for checking network manager bridge config
#   celeste
    eza
    gnupg
    gvfs
    inetutils
    ivpn
    killall
    libvlc
    logitech-udev-rules
    neofetch
    neovim
    ntfs3g
    nfs-utils
    niri
    pavucontrol
#   pmount
    protonvpn-gui
#   rtl_433
#   rtl-sdr
    swaynotificationcenter
    traceroute
    trash-cli
    trayscale
    vim
    vimPlugins.catppuccin-nvim
    vimPlugins.catppuccin-vim
    vimPlugins.dracula-nvim
    vimPlugins.dracula-vim
    wget
## Virtual Support Packages ##
    distrobox
    podman-desktop
    spice spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    win-spice
    win-virtio
##-------------------------##
    ccid
    lm_sensors
    pciutils
    pcsclite
    pcsctools
    usbutils
##-------------------------##    

#Ledger Live
 (writeShellScriptBin "ledger.sh" ''
   appimage-run "/home/${user}/Applications/Ledger.AppImage";
'')
#Trezor Suite
 (writeShellScriptBin "trezor.sh" ''
   appimage-run "/home/${user}/Applications/Trezor.AppImage";
'')
  ];
}
