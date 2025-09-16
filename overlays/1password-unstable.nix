final: prev: let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/6f38b058ccdaa5dccdb058a13a4fffc9477a88dd.tar.gz";
    sha256 = "05qpki3981zl2jk8pdzhwqidrz99yicbyfv3qb6myigqs9xw2n6n";
  }) {
    inherit (prev) system;
    config.allowUnfree = true;
  };
in {
  _1password = unstable._1password;
  _1password-gui = unstable._1password-gui;
}
