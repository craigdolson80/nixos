{ config, pkgs, ... }:

{
  # SSH / RPC
  services.sshd.enable   = true;
  services.rpcbind.enable = true;

  # Udev rules for hardware wallets
  services.udev.packages = with pkgs; [
    ledger-udev-rules
    trezor-udev-rules
  ];

  # Printing and Avahi
  services.printing.enable  = true;

  services.avahi = {
    enable      = true;
    nssmdns4    = true;
    openFirewall = true;
  };

  # 1Password polkit rule (you *could* move this into ../../modules/sys/polkit.nix)
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "com.1password.1Password" &&
          subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';
}
