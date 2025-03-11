{ config, pkgs, ... }:

{

#Default MIME Types

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["brave"];
      "x-scheme-handler/http" = ["brave"];
      "text/html" = ["brave"];
      "x-scheme-handler/https" = ["brave"];
      "x-scheme-handler/chrome" = ["brave"];
      "application/x-extension-htm" = ["brave"];
      "application/x-extension-html" = ["brave"];
      "application/x-extension-shtml" = ["brave"];
      "application/xhtml+xml" = ["brave"];
      "application/x-extension-xhtml" = ["brave"];
      "application/x-extension-xht" = ["brave"];
      "inode/directory" = "thunar.desktop";
    };
    defaultApplications = {
      "application/pdf" = ["brave"];
      "x-scheme-handler/http" = ["brave"];
      "text/html" = ["brave"];
      "x-scheme-handler/https" = ["brave"];
      "x-scheme-handler/chrome" = ["brave"];
      "application/x-extension-htm" = ["brave"];
      "application/x-extension-html" = ["brave"];
      "application/x-extension-shtml" = ["brave"];
      "application/xhtml+xml" = ["brave"];
      "application/x-extension-xhtml" = ["brave"];
      "application/x-extension-xht" = ["brave"];
      "x-scheme-handler/about" = ["brave"];
      "x-scheme-handler/unknown" = ["brave"];
      "x-scheme-handler/sgnl" = ["signal-desktop.desktop"];
      "x-scheme-handler/signalcaptcha" = ["signal-desktop.desktop"];
      "inode/directory" = "thunar.desktop";
    };
  };
}