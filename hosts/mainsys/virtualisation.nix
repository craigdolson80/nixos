{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.podman.enable = true;
}
