# GTK Theme .NIX file

{config, pkgs, ...}:

{

#  Catppuccin
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Green-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "green" ];
        size = "compact";
        tweaks = [ "black" "rimless" ];
        variant = "mocha";
      };
    };
  iconTheme = {
         name = "Papirus-Dark";
         package = pkgs.catppuccin-papirus-folders.override {
          accent = "sapphire";
          flavor = "mocha";
         };
    };
  };
  home = {
    pointerCursor = {
        name = "Catppuccin-Mocha-Dark-Cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 16;
    };
  };

#  Dracula
#  gtk = {
#    enable = true;
#    theme = {
#      name = "Dracula";
#      package = pkgs.dracula-theme;
#   };
#    cursorTheme.name = "Dracula-cursors";
#    iconTheme.name = "Dracula";
#    };  


}
