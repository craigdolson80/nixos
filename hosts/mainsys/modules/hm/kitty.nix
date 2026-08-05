{
  programs.kitty = {
    enable = true;
    font.name = "meslo-lgs-nf";
    font.size = 12;
    settings.scrollback_lines = "10000";
    extraConfig = ''
      include /home/craig/nixos/hosts/mainsys/modules/hm/commonfiles/kitty/kitty-themes/themes/mocha.conf
      confirm_os_window_close 0
      background_opacity 0.8
      dynamic_background_opacity yes
    '';
  };
}
