{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };

    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-icon-theme;
    };
  };
}