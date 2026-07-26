{ ... }:

{
  programs.fastfetch.enable = true;

  xdg.configFile = {
    "fastfetch/config.jsonc".source = ./fastfetch/config.jsonc;
    "fastfetch/nixos.png".source = ./fastfetch/nixos.png;
  };
}
