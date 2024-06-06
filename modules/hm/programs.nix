{config, pkgs, ...}:
{
  home.packages = with pkgs; [
     appimage-run
     arandr
     betterlockscreen
     bitwarden
     brave
     discord
     dmenu #optional for ytfzf
     #electrum
     element-desktop
     feh
     firefox
     flameshot
     font-manager 
     galculator
     geany
     gimp-with-plugins
     glances
     google-chrome
     hplipWithPlugin
     htop
     keepassxc
     kleopatra
     imagemagick
     libreoffice
     lxappearance
     meld
     networkmanagerapplet
     nitrogen
     oh-my-zsh
     #pcmanfm
     picom
     polkit_gnome
     polybar
     remmina
     rpi-imager
     signal-desktop
     sparrow
     telegram-desktop
     tor
     tor-browser-bundle-bin
     torsocks
     ueberzugpp #required for ytfzf
     udiskie
     udisks
     veracrypt
     viewnior
     vlc
     volumeicon
     yt-dlp #optional for ytfzf
     ytfzf
     #yubikey-agent
     #yubikey-manager
     #yubioath-flutter
     xfce.thunar
     xfce.thunar-volman
     xfce.thunar-archive-plugin
     xfce.thunar-dropbox-plugin
     zsh-powerlevel10k

 #Themes
     dracula-theme
     dracula-icon-theme
     catppuccin-gtk 
     catppuccin-kde
     catppuccin
     catppuccin-cursors.mochaDark
 
   ];
}
