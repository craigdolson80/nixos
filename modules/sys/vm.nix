{ config, pkgs, ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;

        # NOTE: ovmf.* options were removed on recent NixOS.
        # OVMF firmware is available by default now.
      };
    };

    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;

  # Optional but often needed for UEFI firmware to actually be present on disk:
  environment.systemPackages = with pkgs; [
    OVMF
  ];
}
