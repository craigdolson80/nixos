{ config, lib, ... }:

let
  actions = config.lib.niri.actions;
  simple = lib.mapAttrs (_: name: { action = builtins.getAttr name actions; }) {
    "Mod+Shift+Slash" = "show-hotkey-overlay";
    "Mod+Left" = "focus-column-left"; "Mod+Down" = "focus-window-down";
    "Mod+Up" = "focus-window-up"; "Mod+Right" = "focus-column-right";
    "Mod+H" = "focus-column-left"; "Mod+J" = "focus-window-down";
    "Mod+K" = "focus-window-up"; "Mod+L" = "focus-column-right";
    "Mod+Ctrl+Left" = "move-column-left"; "Mod+Ctrl+Down" = "move-window-down";
    "Mod+Ctrl+Up" = "move-window-up"; "Mod+Ctrl+Right" = "move-column-right";
    "Mod+Ctrl+H" = "move-column-left"; "Mod+Ctrl+J" = "move-window-down";
    "Mod+Ctrl+K" = "move-window-up"; "Mod+Ctrl+L" = "move-column-right";
    "Mod+Home" = "focus-column-first"; "Mod+End" = "focus-column-last";
    "Mod+Ctrl+Home" = "move-column-to-first"; "Mod+Ctrl+End" = "move-column-to-last";
    "Mod+Shift+Left" = "focus-monitor-left"; "Mod+Shift+Down" = "focus-monitor-down";
    "Mod+Shift+Up" = "focus-monitor-up"; "Mod+Shift+Right" = "focus-monitor-right";
    "Mod+Shift+H" = "focus-monitor-left"; "Mod+Shift+J" = "focus-monitor-down";
    "Mod+Shift+K" = "focus-monitor-up"; "Mod+Shift+L" = "focus-monitor-right";
    "Mod+Shift+Ctrl+Left" = "move-column-to-monitor-left";
    "Mod+Shift+Ctrl+Down" = "move-column-to-monitor-down";
    "Mod+Shift+Ctrl+Up" = "move-column-to-monitor-up";
    "Mod+Shift+Ctrl+Right" = "move-column-to-monitor-right";
    "Mod+Shift+Ctrl+H" = "move-column-to-monitor-left";
    "Mod+Shift+Ctrl+J" = "move-column-to-monitor-down";
    "Mod+Shift+Ctrl+K" = "move-column-to-monitor-up";
    "Mod+Shift+Ctrl+L" = "move-column-to-monitor-right";
    "Mod+Page_Down" = "focus-workspace-down"; "Mod+Page_Up" = "focus-workspace-up";
    "Mod+U" = "focus-workspace-down"; "Mod+I" = "focus-workspace-up";
    "Mod+Ctrl+Page_Down" = "move-column-to-workspace-down";
    "Mod+Ctrl+Page_Up" = "move-column-to-workspace-up";
    "Mod+Ctrl+U" = "move-column-to-workspace-down"; "Mod+Ctrl+I" = "move-column-to-workspace-up";
    "Mod+Shift+Page_Down" = "move-workspace-down"; "Mod+Shift+Page_Up" = "move-workspace-up";
    "Mod+Shift+U" = "move-workspace-down"; "Mod+Shift+I" = "move-workspace-up";
    "Mod+WheelScrollRight" = "focus-column-right"; "Mod+WheelScrollLeft" = "focus-column-left";
    "Mod+Ctrl+WheelScrollRight" = "move-column-right"; "Mod+Ctrl+WheelScrollLeft" = "move-column-left";
    "Mod+Shift+WheelScrollDown" = "focus-column-right"; "Mod+Shift+WheelScrollUp" = "focus-column-left";
    "Mod+Ctrl+Shift+WheelScrollDown" = "move-column-right";
    "Mod+Ctrl+Shift+WheelScrollUp" = "move-column-left";
    "Mod+BracketLeft" = "consume-or-expel-window-left";
    "Mod+BracketRight" = "consume-or-expel-window-right";
    "Mod+Comma" = "consume-window-into-column"; "Mod+Period" = "expel-window-from-column";
    "Mod+R" = "switch-preset-column-width"; "Mod+Shift+R" = "switch-preset-window-height";
    "Mod+Ctrl+R" = "reset-window-height"; "Mod+F" = "maximize-column";
    "Mod+Shift+F" = "fullscreen-window"; "Mod+Ctrl+F" = "expand-column-to-available-width";
    "Mod+C" = "center-column"; "Mod+Ctrl+C" = "center-visible-columns";
    "Mod+V" = "toggle-window-floating"; "Mod+Shift+V" = "switch-focus-between-floating-and-tiling";
    "Mod+W" = "toggle-column-tabbed-display";
    "Mod+Shift+E" = "quit"; "Ctrl+Alt+Delete" = "quit"; "Mod+Shift+P" = "power-off-monitors";
  };
  numbered = lib.listToAttrs (map (n: { name = "Mod+${toString n}"; value.action = actions.focus-workspace n; }) (lib.range 1 9))
    // lib.listToAttrs (map (n: { name = "Mod+Ctrl+${toString n}"; value.action.move-column-to-workspace = n; }) (lib.range 1 9));
  lockedSh = command: { action = actions.spawn-sh command; allow-when-locked = true; };
in {
  programs.niri.settings = {
    input = { keyboard.numlock = true; touchpad = { tap = true; natural-scroll = true; }; };
    outputs."DP-3" = {
      mode = { width = 5120; height = 1440; refresh = 239.761; };
      scale = 1; transform.rotation = 0; position = { x = 1280; y = 0; };
    };
    cursor = { theme = "Adwaita"; size = 24; };
    layout = {
      gaps = 12; center-focused-column = "never";
      preset-column-widths = [ { proportion = 0.33333; } { proportion = 0.5; } { proportion = 0.66667; } ];
      default-column-width.proportion = 0.70;
      focus-ring = { width = 4; active.color = "#94e2d5"; inactive.color = "#505050"; };
      border = { enable = false; width = 4; active.color = "#ffc87f"; inactive.color = "#505050"; urgent.color = "#9b0000"; };
      shadow = { enable = true; softness = 30; spread = 5; offset = { x = 0; y = 5; }; color = "#0007"; };
    };
    spawn-at-startup = [ { argv = [ "xwayland-satellite" ":1" ]; } ];
    hotkey-overlay.skip-at-startup = true;
    prefer-no-csd = true;
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    window-rules = [
      { matches = [ { app-id = ''^org\.wezfurlong\.wezterm$''; } ]; default-column-width = {}; }
      { matches = [ { app-id = ''firefox$''; title = ''^Picture-in-Picture$''; } ]; open-floating = true; }
      { matches = [ { app-id = ''galculator$''; title = ''^galculator$''; } ]; open-floating = true; }
      { geometry-corner-radius = { top-left = 9.0; top-right = 9.0; bottom-left = 9.0; bottom-right = 9.0; }; clip-to-geometry = true; }
    ];
    binds = simple // numbered // {
      Print.action.screenshot = [];
      "Ctrl+Mod+P".action.screenshot-screen = [];
      "Alt+Mod+P".action.screenshot-window = [];
      "Mod+T" = { action = actions.spawn "kitty"; hotkey-overlay.title = "Open a Terminal: kitty"; };
      "Mod+D" = { action = actions.spawn "fuzzel"; hotkey-overlay.title = "Run an Application: fuzzel"; };
      "Super+Alt+L" = { action = actions.spawn "swaylock"; hotkey-overlay.title = "Lock the Screen: swaylock"; };
      "Super+Return" = { action = actions.spawn "kitty"; hotkey-overlay.title = "Open a Terminal: kitty"; };
      "Super+space" = { action = actions.spawn "fuzzel"; hotkey-overlay.title = "Run an Application: fuzzel"; };
      "Super+Slash" = { action = actions.spawn "~/.config/niri/dms/keybindings.sh"; hotkey-overlay.title = "Keybindings Help"; };
      "Super+Alt+S" = lockedSh "pkill orca || exec orca" // { hotkey-overlay.hidden = true; };
      "XF86AudioRaiseVolume" = lockedSh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
      "XF86AudioLowerVolume" = lockedSh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
      "XF86AudioMute" = lockedSh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "XF86AudioMicMute" = lockedSh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      "XF86AudioPlay" = lockedSh "playerctl play-pause"; "XF86AudioStop" = lockedSh "playerctl stop";
      "XF86AudioPrev" = lockedSh "playerctl previous"; "XF86AudioNext" = lockedSh "playerctl next";
      "XF86MonBrightnessUp" = { action = actions.spawn [ "brightnessctl" "--class=backlight" "set" "+10%" ]; allow-when-locked = true; };
      "XF86MonBrightnessDown" = { action = actions.spawn [ "brightnessctl" "--class=backlight" "set" "10%-" ]; allow-when-locked = true; };
      "Mod+O" = { action = actions.toggle-overview; repeat = false; }; "Mod+Q" = { action = actions.close-window; repeat = false; };
      "Mod+WheelScrollDown" = { action = actions.focus-workspace-down; cooldown-ms = 150; };
      "Mod+WheelScrollUp" = { action = actions.focus-workspace-up; cooldown-ms = 150; };
      "Mod+Ctrl+WheelScrollDown" = { action = actions.move-column-to-workspace-down; cooldown-ms = 150; };
      "Mod+Ctrl+WheelScrollUp" = { action = actions.move-column-to-workspace-up; cooldown-ms = 150; };
      "Mod+Minus".action = actions.set-column-width "-10%"; "Mod+Equal".action = actions.set-column-width "+10%";
      "Mod+Shift+Minus".action = actions.set-window-height "-10%"; "Mod+Shift+Equal".action = actions.set-window-height "+10%";
      "Mod+Escape" = { action = actions.toggle-keyboard-shortcuts-inhibit; allow-inhibiting = false; };
    };
  };
}
