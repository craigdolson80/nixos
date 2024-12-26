{config, pkgs, ...}:
{
  home.packages = with pkgs; [
     appimage-run
     arandr
     betterlockscreen
     brave
     cubicsdr
     discord
     dmenu #optional for ytfzf
     #electrum
     #element-desktop
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
     mqtt-explorer
     networkmanagerapplet
     nitrogen
     obsidian
     oh-my-zsh
     picom
     polkit_gnome
     polybar
     remmina
     rpi-imager
     rtl-sdr
     signal-desktop
     sparrow
     telegram-desktop
     #thunderbird
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
     yubikey-agent
     yubikey-manager
     yubioath-flutter
     xfce.thunar
     xfce.thunar-volman
     xfce.thunar-archive-plugin
     xfce.thunar-dropbox-plugin
     zsh-powerlevel10k

 #Themes
     dracula-theme
     dracula-icon-theme
     dracula-qt5-theme
     catppuccin-gtk 
     catppuccin-kde
     catppuccin
     catppuccin-cursors.mochaDark
 
   ];
}
