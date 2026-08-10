{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, noctalia, niri, ... }: {
    nixosConfigurations = {
      t490 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
modules = [
  ./configuration.nix
  home-manager.nixosModules.home-manager
  {
    # home-manager module settings (system-level)
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    # 🔹 this is the important line:
    home-manager.backupFileExtension = "hm-bak";

    # user-level config lives in home.nix
    home-manager.users.craig = import ./home.nix;
          }
        ];
      };
    };
   };
  }

