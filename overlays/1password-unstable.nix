final: prev: let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    # For reproducibility, you can pin to a specific commit:
    # url = "https://github.com/NixOS/nixpkgs/archive/<commit>.tar.gz";
  }) {
    inherit (prev) system;
    config.allowUnfree = true;
  };
in {
  _1password = unstable._1password;
  _1password-gui = unstable._1password-gui;
}
