{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Temporary insecure package exception
  nixpkgs.config.permittedInsecurePackages = [
    "python3.12-ecdsa-0.19.1"
  ];

  # Nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    download-buffer-size  = 33554432; # 32 MiB (default is 1 MiB)
  };

  # System packages (you can also move this into syspkgs.nix if you prefer)
  environment.systemPackages = with pkgs; [
    _1password-cli
    _1password-gui
  ];
}
