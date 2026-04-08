{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      t490 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
modules = [
  ./hosts/t490/configuration.nix
  home-manager.nixosModules.home-manager
  {
    # home-manager module settings (system-level)
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    # 🔹 this is the important line:
    home-manager.backupFileExtension = "hm-bak";

    # user-level config lives in home.nix
    home-manager.users.craig = import ./hosts/t490/home.nix;
          }
        ];
      };
    };
   };
  }

