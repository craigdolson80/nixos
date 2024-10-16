{ config, pkgs, ... }:
let
  user="craig";
in
{
  environment.systemPackages = with pkgs; [
    bat
    #celeste
    eza
    gnupg
    gvfs
    inetutils
    killall
    libvlc
    neofetch
    neovim
    nfs-utils
    pavucontrol
    pmount
    proton-pass
    protonvpn-gui
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

  ];
}
