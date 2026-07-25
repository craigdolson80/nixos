{ config, pkgs, ... }:
let
  user="craig";
in
{
  environment.systemPackages = with pkgs; [
    alacritty
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
    spice spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    win-spice
    virtio-win
##-------------------------##
    ccid
    lm_sensors
    pciutils
    pcsclite
    pcsc-tools
    usbutils
##-------------------------##  

## System Themes
  catppuccin-gtk
  ];
}
