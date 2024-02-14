{ config, pkgs, ... }:

{

#Default MIME Types

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["Google-chrome.desktop"];
      "x-scheme-handler/http" = ["Google-chrome.desktop"];
      "text/html" = ["Google-chrome.desktop"];
      "x-scheme-handler/https" = ["Google-chrome.desktop"];
      "x-scheme-handler/chrome" = ["Google-chrome.desktop"];
      "application/x-extension-htm" = ["Google-chrome.desktop"];
      "application/x-extension-html" = ["Google-chrome.desktop"];
      "application/x-extension-shtml" = ["Google-chrome.desktop"];
      "application/xhtml+xml" = ["Google-chrome.desktop"];
      "application/x-extension-xhtml" = ["Google-chrome.desktop"];
      "application/x-extension-xht" = ["Google-chrome.desktop"];
      "inode/directory" = "thunar.desktop";
    };
    defaultApplications = {
      "application/pdf" = ["Google-chrome.desktop"];
      "x-scheme-handler/http" = ["Google-chrome.desktop"];
      "text/html" = ["Google-chrome.desktop"];
      "x-scheme-handler/https" = ["Google-chrome.desktop"];
      "x-scheme-handler/chrome" = ["Google-chrome.desktop"];
      "application/x-extension-htm" = ["Google-chrome.desktop"];
      "application/x-extension-html" = ["Google-chrome.desktop"];
      "application/x-extension-shtml" = ["Google-chrome.desktop"];
      "application/xhtml+xml" = ["Google-chrome.desktop"];
      "application/x-extension-xhtml" = ["Google-chrome.desktop"];
      "application/x-extension-xht" = ["Google-chrome.desktop"];
      "x-scheme-handler/about" = ["Google-chrome.desktop"];
      "x-scheme-handler/unknown" = ["Google-chrome.desktop"];
      "x-scheme-handler/sgnl" = ["signal-desktop.desktop"];
      "x-scheme-handler/signalcaptcha" = ["signal-desktop.desktop"];
      "inode/directory" = "thunar.desktop";
    };
  };
}