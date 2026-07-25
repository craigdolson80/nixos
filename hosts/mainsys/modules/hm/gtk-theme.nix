# GTK Theme .NIX file

{config, pkgs, ...}:

{

#  Dracula
 gtk = {
   enable = true;
   theme = {
     name = "Dracula";
     package = pkgs.dracula-theme;
  };
   cursorTheme.name = "Dracula-cursors";
   iconTheme.name = "Dracula";
   };  

}
