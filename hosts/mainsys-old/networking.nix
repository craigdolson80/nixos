{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Disable NM wait-online; it often causes rebuild delays/timeouts
  systemd.services.NetworkManager-wait-online.enable = false;

  # DNS & search domain
  networking.nameservers = [
    "100.100.100.100"
    "8.8.8.8"
    "1.1.1.1"
  ];
  networking.search = [ "tail72594.ts.net" ];

  # Tailscale
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "both";

  # IVPN
  services.ivpn.enable = true;
}
