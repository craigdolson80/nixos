# hyprland.conf created in extra config
# default.nix
{ config, inputs, pkgs, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    extraConfig = ''

#source = themes/mocha.conf
# See https://wiki.hyprland.org/Configuring/Monitors/
#monitor=,preferred,auto,auto
monitor=DP-1, 1920x1080, 0x0, 1
monitor=DP-2, 1920x1080, 1920x0, 1
workspace=DP-1,1
workspace=DP-1,2
workspace=DP-1,3
workspace=DP-1,4
workspace=DP-1,5
workspace=DP-2,6
workspace=DP-2,7
workspace=DP-2,8
workspace=DP-2,9
workspace=DP-2,0


# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch

exec-once = waybar &
exec-once = nm-applet &
exec-once = swww init &
exec-once = ~/swayidle/lockscreen.sh &
exec-once = hyprctl dispatch exec "sleep 5s && udiskie -t"

# Source a file (multi-file configs)
source = /home/craig/.config/hypr/colors

# Some default env vars.
env = XCURSOR_SIZE,24

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =
    numlock_by_default = true
    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = $mauve $pink 90deg
    col.inactive_border = $base

    layout = dwindle
}

misc {
  disable_hyprland_logo = true
} 

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10
    #drop_shadow = yes
    #shadow_range = 4
    #shadow_render_power = 3
    #col.shadow = rgba(1E202966)
    drop_shadow = yes
    shadow_range = 30
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic-mouse-v1 {        
    sensitivity = -0.5
}

# Example windowrule v1
windowrule = float, ^(galculator)$
windowrule = float, ^(pavucontrol)$
windowrule = float, ^(virt-manager)$
windowrule = float, ^(waypaper)$

# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, kitty
bind = $mainMod, Q, killactive, 
#bind = $mainMod, escape, exit, 
bind = $mainMod, F, exec, pcmanfm
bind = $mainMod, B, exec, firefox
bind = $mainMod, V, togglefloating, 
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod ALT, Q, exec, swaylock -i ~/github/wallpaper/096.jpg
bind = $mainMod CTRL, Q, exec, wlogout
bind = $mainMod CTRL, R, exec, hyprctl reload
bind = $mainMod, space, exec, $HOME/nixos/modules/hm/commonfiles/rofi/modified_for_hyprland/launchers/type-7/launcher.sh

# Move focus with mainMod + arrow keys
bind = $mainMod, left, workspace, e-1
bind = $mainMod, right, workspace, e+1
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Special Workspace / scratchpad
bind = $mainMod, grave, togglespecialworkspace
bind = $mainMod SHIFT, grave, movetoworkspace, special

#Print Screen
bind = , Print, exec, grim -g "$(slurp)"
bind = ALT, Print, exec, grimblast --notify --cursor copysave output
    '';
  };

# This section is necessary to use external color files. Create home file, and source it above
##
##Catppuccin Mocha
  home.file.".config/hypr/colors".text = ''
$rosewaterAlpha = f5e0dc
$flamingoAlpha  = f2cdcd
$pinkAlpha      = f5c2e7
$mauveAlpha     = cba6f7
$redAlpha       = f38ba8
$maroonAlpha    = eba0ac
$peachAlpha     = fab387
$yellowAlpha    = f9e2af
$greenAlpha     = a6e3a1
$tealAlpha      = 94e2d5
$skyAlpha       = 89dceb
$sapphireAlpha  = 74c7ec
$blueAlpha      = 89b4fa
$lavenderAlpha  = b4befe

$textAlpha      = cdd6f4
$subtext1Alpha  = bac2de
$subtext0Alpha  = a6adc8

$overlay2Alpha  = 9399b2
$overlay1Alpha  = 7f849c
$overlay0Alpha  = 6c7086

$surface2Alpha  = 585b70
$surface1Alpha  = 45475a
$surface0Alpha  = 313244

$baseAlpha      = 1e1e2e
$mantleAlpha    = 181825
$crustAlpha     = 11111b

$rosewater = 0xfff5e0dc
$flamingo  = 0xfff2cdcd
$pink      = 0xfff5c2e7
$mauve     = 0xffcba6f7
$red       = 0xfff38ba8
$maroon    = 0xffeba0ac
$peach     = 0xfffab387
$yellow    = 0xfff9e2af
$green     = 0xffa6e3a1
$teal      = 0xff94e2d5
$sky       = 0xff89dceb
$sapphire  = 0xff74c7ec
$blue      = 0xff89b4fa
$lavender  = 0xffb4befe

$text      = 0xffcdd6f4
$subtext1  = 0xffbac2de
$subtext0  = 0xffa6adc8

$overlay2  = 0xff9399b2
$overlay1  = 0xff7f849c
$overlay0  = 0xff6c7086

$surface2  = 0xff585b70
$surface1  = 0xff45475a
$surface0  = 0xff313244

$base      = 0xff1e1e2e
$mantle    = 0xff181825
$crust     = 0xff11111b
'';

}
