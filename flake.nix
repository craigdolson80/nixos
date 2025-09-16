{
  description = "NixOS configuration";

  inputs = {
    #hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      mainsys = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        # Define pkgs sets
        specialArgs = {
          inherit nixpkgs-unstable;
        };

        modules = [
          hosts/mainsys/configuration.nix
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.craig = import hosts/mainsys/home.nix;

            # Pull only 1Password from unstable
            environment.systemPackages = let
              unstable = import nixpkgs-unstable { system = "x86_64-linux"; };
              config.allowUnfree = true;
            in [
              unstable._1password-gui
              unstable._1password
            ];
          }

        ];

        nixpkgs.config.allowUnfree = true;
        
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

