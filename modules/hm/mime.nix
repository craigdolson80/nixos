{ config, pkgs, ... }:

{

#Default MIME Types

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["brave.desktop"];
      "x-scheme-handler/http" = ["brave.desktop"];
      "text/html" = ["brave.desktop"];
      "x-scheme-handler/https" = ["brave.desktop"];
      "x-scheme-handler/chrome" = ["brave.desktop"];
      "application/x-extension-htm" = ["brave.desktop"];
      "application/x-extension-html" = ["brave.desktop"];
      "application/x-extension-shtml" = ["brave.desktop"];
      "application/xhtml+xml" = ["brave.desktop"];
      "application/x-extension-xhtml" = ["brave.desktop"];
      "application/x-extension-xht" = ["brave.desktop"];
      "inode/directory" = "thunar.desktop";
    };
    defaultApplications = {
      "application/pdf" = ["brave.desktop"];
      "x-scheme-handler/http" = ["brave.desktop"];
      "text/html" = ["brave.desktop"];
      "x-scheme-handler/https" = ["brave.desktop"];
      "x-scheme-handler/chrome" = ["brave.desktop"];
      "application/x-extension-htm" = ["brave.desktop"];
      "application/x-extension-html" = ["brave.desktop"];
      "application/x-extension-shtml" = ["brave.desktop"];
      "application/xhtml+xml" = ["brave.desktop"];
      "application/x-extension-xhtml" = ["brave.desktop"];
      "application/x-extension-xht" = ["brave.desktop"];
      "x-scheme-handler/about" = ["brave.desktop"];
      "x-scheme-handler/unknown" = ["brave.desktop"];
      "x-scheme-handler/sgnl" = ["signal-desktop.desktop"];
      "x-scheme-handler/signalcaptcha" = ["signal-desktop.desktop"];
      "inode/directory" = "thunar.desktop";
    };
  };
}