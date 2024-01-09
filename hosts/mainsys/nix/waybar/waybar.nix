{ config, lib, pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"] ;} );
#    systemd = {
#      enable = false;
#      target = "graphical-session.target";
#    };
    
    settings = {
      mainBar = {
        layer = "top";
        height = 38;
        modules-left = ["custom/launcher" "hyprland/workspaces" "hyprland/mode" "hyprland/scratchpad" "custom/media"];
        modules-center = ["hyprland/window"];
        modules-right = ["custom/cycle_wall" "pulseaudio" "cpu" "memory" "disk" "clock" "tray"];
      };
    
     "hyprland/workspaces" = {
         "disable-scroll" = "true";
         "all-outputs" = "true";
         "warp-on-scroll" = "false";
         "format" = "{name}";
         "format-icons" = {
             "1" = "";
             "2" = "";
             "3" = "";
             "4" = "";
             "5" = "";
             "6" = "";
             "7" = "";
             "8" = "";
             "9" = "";
             "urgent" = "";
             "focused" = "";
             "default" = "";
         };
     
    "keyboard-state" = {
        "numlock" = "true";
        "capslock" = "true";
        "format" = "{name} {icon}";
        "format-icons" = {
            "locked" = "";
            "unlocked" = "";
            };
        };
    "hyprland/mode" = {
        "format" = "<span style=\"italic\">{}</span>";
    };
    
    "hyprland/scratchpad" = {
        "format" = "{icon} {count}";
        "show-empty" = "false";
        "format-icons" = ["" ""];
        "tooltip" = "true";
        "tooltip-format" = "{app}: {title}";
    };

    "tray" = {
        "spacing" = "10";
    };

    
    "clock" = {
        "format" = "{: %R   %m/%d}";
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    "cpu" = {
        "format" = "{usage}% ";
        "tooltip" = "false";
        
    };
    "memory" = {
        "format" = "{}% 󰟜";
    };

    "disk" = {
        "interval" = "30";
        "format" = "{percentage_used}% ";
        "path" = "/";
    };

    "battery" = {
        "states" = {
            "good" = "95";
            "warning" = "30";
            "critical" = "15";
        };
        "format" = "{capacity}% {icon}";
        "format-charging" = "{capacity}% ";
        "format-plugged" = "{capacity}% ";
        "format-alt" = "{time} {icon}";
        "format-icons" = ["" "" "" "" ""];
    };
    
    "network" = {
        "format-wifi" = "{essid} ({signalStrength}%) ";
        "format-ethernet" = "{ipaddr}/{cidr} ";
        "tooltip-format" = "{ifname} via {gwaddr} ";
        "format-linked" = "{ifname} (No IP) ";
        "format-disconnected" = "Disconnected ⚠";
        "format-alt" = "{ifname} = {ipaddr}/{cidr}";
    };
    
    "pulseaudio" = {
        "format" = "{volume}% {icon} {format_source}";
        "format-bluetooth" = "{volume}% {icon} {format_source}";
        "format-bluetooth-muted" = " {icon} {format_source}";
        "format-muted" = " {format_source}";
        "format-source" = "{volume}% ";
        "format-source-muted" = "";
        "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
        };
        "on-click" = "pavucontrol";
    };

    "custom/launcher" = {
        "format" = "";
        "on-click" = "wlogout";
   };
   
   "custom/cycle_wall" = {
    "format" = " ";
    "on-click" = "~/.config/hypr/scripts/changeWallpaper";
    "tooltip-format" = "Change wallpaper";
    };
    
    "custom/weather" = {
        "tooltip" = "true";
        "format" = "{}";
        "interval" = "30";
        "exec" = "~/.config/waybar/scripts/waybar-wttr.py";
        "return-type" = "json";
    };      
};

style = {
    description = ''
    * {
    border: none;
    border-radius: 0;
    font-family: Iosveka Nerd Font, monospace;
    font-weight: bold;
    font-size: 12px;
    min-height: 0;
}

window#waybar {
    background: rgba(25, 25, 25, 0);
    color: #cdd6f4;
    padding: 0;
    margin: 0;
}

tooltip {
    background: rgba(25, 25, 25, 0.65);
    border-radius: 10px;
    border-width: 2px;
    border-style: solid;
    border-color: @mantle;
}

#workspaces button {
    padding: 5px;
    color: @text;
    background: transparent;
    margin-right: 5px;
    border-radius: 5px;
}

#workspaces button.active {
    color: @base;
    background: @green;
    border-radius: 5px;
}

#workspaces button.focused {
    color: #a6adc8;
    background: rgba(25, 25, 25, 0.65);
    border-radius: 5px;
}

#workspaces button.urgent {
    color: #11111b;
    background: @flamingo;
    border-radius: 5px;
}

#workspaces button:hover {
    background: @sky;
    color: #ffffff;
    border-radius: 5px;
}

#custom-language,
#custom-updates,
#custom-caffeine,
#custom-weather,
#custom-cycle_wall,
#custom-launcher,
#window,
#cpu,
#memory,
#disk,
#clock,
#battery,
#pulseaudio,
#network,
#workspaces,
#tray,
#backlight {
    background: #1e1e2e;
    padding: 0px 10px;
    margin: 3px 0px;
    margin-top: 10px;
    border: 1px solid #181825;
}

#custom-launcher {
    color: #89dceb;
    font-size: 15px;
    border-radius: 5px 0px 0px 5px;
    background: rgba(25, 25, 25, 0.65);
    margin-left: 5px;
    padding-right: 10px;
    padding-top: 2px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#workspaces {
    background: rgba(25, 25, 25, 0.65);
    border-radius: 0px 5px 5px 0px;
    padding-right: 0px;
    padding-top: 2px;
    padding-left: 5px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#custom-caffeine {
    color: #89dceb;
    border-radius: 5px 0px 0px 5px;
    border-right: 0px;
    margin-left: 5px;
}

#custom-language {
    color: #f38ba8;
    border-left: 0px;
    border-right: 0px;
}

#custom-updates {
    color: #f5c2e7;
    background: rgba(25, 25, 25, 0.65);
    border-radius: 5px 0px 0px 5px;
    border-left: 0px;
    border-right: 0px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#window {
    border-radius: 5px;
    margin-left: 5px;
    margin-right: 60px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
    background: rgba(25, 25, 25, 0.65);
}

#clock {
    color: @peach;
    border-radius: 5px 5px 5px 5px;
    background: rgba(25, 25, 25, 0.65);
    margin-right: 10px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
    
}

#network {
    color: #f9e2af;
    border-radius: 5px 5px 5px 5px;
    background: rgba(25, 25, 25, 0.65);
    margin-right: 10px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#pulseaudio {
    color: @teal;
    background: rgba(25, 25, 25, .65);
    border-radius: 5px 5px 5px 5px;
    margin-right: 10px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#battery {
    color: #a6e3a1;
    border-radius: 0px 5px 5px 0;
    margin-right: 10px;
    border-left: 0px;
}

#custom-weather {
    border-radius: 5px 5px 5px 5px;
    background: rgba(25, 25, 25, 0.65);
    margin-right: 5px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#cpu {
    color: @mauve;
    background: rgba(25, 25, 25, 0.65);
    border-radius: 5px 0px 0px 5px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#memory {
    color: @mauve;
    background: rgba(25, 25, 25, 0.65);
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#disk {
    color: @mauve;
    background: rgba(25, 25, 25, 0.65);
    border-radius: 0px 5px 5px 0px;
    margin-right: 10px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#custom-cycle_wall {
    background: rgba(25, 25, 25, 0.65);
    border-radius: 5px 5px 5px 5px;
    margin-right: 5px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#custom-cycle_wall {
    background: rgba(25, 25, 25, 0.65);
    border-radius: 5px 5px 5px 5px;
    margin-right: 5px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

#custom-weather {
    background: rgba(25, 25, 25, 0.65);
    border-radius: 5px 5px 5px 5px;
    margin-right: 5px;
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}


#tray {
    border-radius: 5px;
    margin-right: 5px;
    background: rgba(25, 25, 25, 0.65);
    border-top: 0px solid transparent;
    border-bottom: 0px solid transparent;
    border-right: 0px solid transparent;
    border-left: 0px solid transparent;
}

'';
};
};
};
}
#just a text note