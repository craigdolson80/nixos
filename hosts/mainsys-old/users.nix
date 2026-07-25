{ config, pkgs, ... }:

{
  # Main user
  users.users.craig = {
    isNormalUser = true;
    description  = "Craig Olson";
    extraGroups  = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "lpd"
      "libvirtd"
      "users"
      "ntfsuser"
      "fuse"
    ];
    packages = with pkgs; [ ];
    shell    = pkgs.zsh;
  };

  # Shell configuration
  programs.zsh.enable = true;
  programs.zsh.promptInit =
    "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
}
