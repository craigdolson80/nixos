{ config, pkgs, ... }:
let
  user="craig";
in
{
  environment.systemPackages = with pkgs; [
    bat
    bridge-utils #for checking network manager bridge config
    #celeste
    eza
    gnupg
    gvfs
    inetutils
    killall
    libvlc
    logitech-udev-rules
    ltwheelconf
    neofetch
    neovim
    ntfs3g
    nfs-utils
    pavucontrol
#    pmount
    protonvpn-gui
    rtl_433
    rtl-sdr
    swaynotificationcenter
    tigervnc
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
#Beeper
 (writeShellScriptBin "beeper.sh" ''
   appimage-run "/home/${user}/Applications/Beeper.AppImage";
'')
#Radar Omega
 (writeShellScriptBin "radaromega.sh" ''
   appimage-run "/home/${user}/Applications/RadarOmega.AppImage";
'')

  ];
}
