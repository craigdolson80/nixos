# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/39d8e1b4-319a-418d-872c-82c3c43b1705";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-c910bf98-d277-405c-afe2-aca65e5bbbad".device = "/dev/disk/by-uuid/c910bf98-d277-405c-afe2-aca65e5bbbad";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/FFC5-BBA5";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/1101ae11-0725-4fb3-be5d-21bba953bb68"; }
    ];

  fileSystems."/run/media/craig/Data" =
    { device = "/dev/disk/by-uuid/4fe9bc28-f6b7-49fe-8978-538d76999402"; 
    fsType = "ext4";
    };
    

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0f1.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.nm-bridge.useDHCP = lib.mkDefault true;
  # networking.interfaces.tailscale0.useDHCP = lib.mkDefault true;
  # networking.interfaces.virbr0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp7s0f1u3u1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
