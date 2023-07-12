{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      mainsys = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/mainsys/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/mainsys/home.nix;

          }
        ];
      };
      opx5090 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/opx-5090/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/opx-5090/home.nix;

          }
        ];
      };
    };
  };
}

