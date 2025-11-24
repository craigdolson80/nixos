{ config, pkgs, ... }:

{
  imports = [
    # Hardware
    ./hardware-configuration.nix

    # Shared system modules
    ../../modules/sys/fonts.nix
    ../../modules/sys/vm.nix
    ../../modules/sys/polkit.nix
    ../../modules/sys/syspkgs.nix
    ../../modules/sys/hypr.nix

    # Host-specific modules
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./desktop.nix
    ./virtualisation.nix
    ./users.nix
    ./services.nix
    ./nix-settings.nix
  ];

  # Host name and state version are very host-specific, so keep them here.
  networking.hostName = "mainsys";

  system.stateVersion = "25.05"; # Did you read the comment? :)
}
