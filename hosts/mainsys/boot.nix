{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Old-style FUSE compatibility
  boot.kernelModules = [ "fuse" ];
  boot.extraModulePackages = [ ];
}
