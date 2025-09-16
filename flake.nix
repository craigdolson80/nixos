{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }: let
    system = "x86_64-linux";

    # Import stable pkgs with allowUnfree enabled
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    # Import unstable pkgs with allowUnfree enabled (for 1Password)
    pkgsUnstable = import nixpkgs-unstable {
      inherit system;
      config = { allowUnfree = true; };
    };
  in {
    nixosConfigurations = {

      # mainsys using pkgs.lib.nixosSystem (pkgs has allowUnfree)
      mainsys = pkgs.lib.nixosSystem {
        inherit system;

        # make pkgsUnstable available inside the NixOS modules as "pkgsUnstable"
        specialArgs = {
          inherit pkgsUnstable;
        };

        modules = [
          # your existing modules
          ./hosts/mainsys/configuration.nix
          home-manager.nixosModules.home-manager

          # small inline module adding the unstable-packages
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import ./hosts/mainsys/home.nix;

            # Use the unstable pkgs that we passed in specialArgs
            # Note: inside the module, refer to "pkgsUnstable" (from specialArgs)
            environment.systemPackages = with pkgs; ([
              # stable packages here...
            ] ++ (with pkgsUnstable; [
              _1password
              _1password-gui
            ]));
          }
        ];
      };
      opx-5090 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          #hyprland.nixosModules.default
          #{ programs.hyprland.enable = true; }
          hosts/opx-5090/configuration.nix
          home-manager.nixosModules.home-manager
          {
            #home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/opx-5090/home.nix;

          }
        ];
      };
      nuc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/nuc/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/nuc/home.nix;

          }
        ];
      };
      virtual = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/virtual/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/virtual/home.nix;
          }
        ];
      };
      precision-3800 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/precision-3800/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/precision-3800/home.nix;
          }
        ];
      };
       t480 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/t480/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/t480/home.nix;
          }
        ];
      };
    };  
  };
}  

