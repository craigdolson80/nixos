{ ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      accessibility.ui_scale = 1.0;

      backdrop.enabled = true;

      shell = {
        corner_radius_scale = 1.0;
        font_family = "Noto Sans";
        time_format = "{:%H:%M}";
        date_format = "%a, %b %d";
        telemetry_enabled = false;
        avatar_path = "/home/craig/Pictures/NixOS.png";
        clipboard_enabled = true;
        clipboard_auto_paste = "ctrl_v";

        animation = {
          enabled = true;
          speed = 1.0;
        };

        shadow = {
          direction = "down_right";
          alpha = 0.55;
        };

        launcher.categories = false;

        panel = {
          transparency_mode = "soft";
          borders = false;
          shadow = true;
          launcher_placement = "attached";
          clipboard_placement = "floating";
          clipboard_position = "center";
          control_center_placement = "attached";
          wallpaper_placement = "attached";
          session_placement = "floating";
          open_near_click_control_center = false;
        };

        mpris.blacklist = [ ];
      };

      wallpaper = {
        enabled = true;
        directory = "/home/craig/git/wallpaper";
        fill_mode = "crop";
        fill_color = "#000000";
        transition = [
          "fade"
          "disc"
          "stripes"
          "wipe"
          "honeycomb"
        ];
        transition_duration = 1500;
        edge_smoothness = 0.05;
        transition_on_startup = false;

        automation = {
          enabled = true;
          interval_seconds = 900;
          order = "random";
          recursive = true;
        };

        default.path = "/home/craig/git/wallpaper/129.jpg";
        last.path = "/home/craig/git/wallpaper/129.jpg";
        monitors."DP-1".path = "/home/craig/git/wallpaper/129.jpg";
        monitors."DP-2".path = "/home/craig/git/wallpaper/129.jpg";
        monitors."eDP-1".path = "/home/craig/Pictures/wallpaper/021.jpg";
      };

      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Tokyo-Night";
        community_palette = "Atuel";
        custom_palette = "Tokyo-Night";
        pure_black_dark = false;
        wallpaper_scheme = "m3-content";

        templates = {
          enable_builtin_templates = true;
          builtin_ids = [
            "alacritty"
            "btop"
            "cava"
            "gtk3"
            "gtk4"
            "helix"
            "kitty"
            "niri"
            "wezterm"
          ];
          enable_community_templates = true;
          community_ids = [
            "neovim"
            "vscode"
            "fuzzel"
            "yazi"
          ];
        };
      };

      notification = {
        enable_daemon = true;
        layer = "overlay";
        background_opacity = 1.0;
      };

      control_center.width = 800;

      hooks.started = "trayscale";

      plugins.enabled = [ "noctalia/translator" ];

      osd = {
        position = "top_right";
        orientation = "horizontal";
        background_opacity = 1.0;
        kinds = {
          volume = true;
          volume_output = true;
          volume_input = true;
          brightness = true;
        };
      };

      lockscreen = {
        enabled = true;
        blurred_desktop = true;
        blur_intensity = 0.15;
        tint_intensity = 0.0;
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ "lockscreen-login-box@DP-2" "lockscreen-login-box@DP-1" "lockscreen-login-box@eDP-1" ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget."lockscreen-login-box@DP-1" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 2560.0;
          cy = 1321.0;
          output = "DP-1";
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
          };
        };

        widget."lockscreen-login-box@DP-2" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 960.0;
          cy = 961.0;
          output = "DP-2";
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
          };
        };

        widget."lockscreen-login-box@eDP-1" = {
          box_height = 70.0;
          box_width = 400.0;
          cx = 768.0;
          cy = 745.0;
          output = "eDP-1";
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
          };
        };
      };

      system.monitor.enabled = true;

      weather = {
        enabled = true;
        unit = "imperial";
        effects = true;
      };

      audio = {
        enable_overdrive = false;
        enable_sounds = false;
        sound_volume = 0.5;
      };

      nightlight = {
        enabled = false;
        force = false;
        temperature_day = 6500;
        temperature_night = 4000;
      };

      location = {
        auto_locate = false;
        address = "Rockford, IL";
      };

      idle = {
        behavior_order = [ "lock" "screen-off" ];
        behavior = {
          lock = {
            timeout = 660;
            action = "lock";
            enabled = true;
          };
          screen-off = {
            timeout = 600;
            action = "screen_off";
            enabled = true;
          };
        };
      };

      keybinds = {
        validate = [
          "return"
          "kp_enter"
        ];
        cancel = [ "escape" ];
        left = [ "left" ];
        right = [ "right" ];
        up = [ "up" ];
        down = [ "down" ];
      };

      bar.main = {
        position = "top";
        background_opacity = 0.75;
        radius = 12;
        radius_top_left = 12;
        radius_top_right = 12;
        concave_edge_corners = false;
        margin_edge = 5;
        margin_ends = 500;
        padding = 6;
        thickness = 30;
        widget_spacing = 2;
        scale = 1.0;
        shadow = true;
        auto_hide = false;
        show_on_workspace_switch = true;
        reserve_space = true;
        capsule = true;
        capsule_opacity = 1.0;
        capsule_padding = 4.0;
        capsule_thickness = 0.65;

        start = [
          "launcher"
          "clock"
          "sysmon"
          "active_window"
        ];
        center = [ "workspaces" ];
        end = [
          "battery"
          "tray"
          "notifications"
          "network"
          "bluetooth"
          "volume"
          "control-center"
        ];
      };

      dock = {
        enabled = false;
        position = "bottom";
        background_opacity = 1.0;
        auto_hide = true;
        active_monitor_only = true;
        launcher_custom_image = "/nix/store/ywlhln5hh4pgb30vvaxpvqk62g5v9wjk-noctalia-5.0.0/share/noctalia/assets/images/distros/nixos.svg";
        launcher_custom_image_colorize = true;
        launcher_position = "start";
        pinned = [ ];
      };

      desktop_widgets.enabled = false;

      widget = {
        launcher = {
          capsule = true;
          capsule_opacity = 0.0;
          capsule_padding = 2;
          custom_image = "/home/craig/nixos/hosts/mainsys/modules/icons/NixOS.png";
          custom_image_colorize = false;
          scale = 1.15;
        };

        clock = {
          format = "{:%H:%M %a, %b %d}";
          tooltip_format = "{:%H:%M %a, %b %d}";
          font_weight = 700;
        };

        active_window = {
          max_length = 145.0;
          icon_size = 16.0;
          title_scroll = "on_hover";
          display = "icon_and_text";
        };

        media = {
          max_length = 145.0;
          art_size = 16.0;
          title_scroll = "on_hover";
        };

        workspaces = {
          label_source = "name";
          show_labels = false;
        };

        battery.display_mode = "graphic";
        brightness.show_label = false;
        network.show_label = false;
        volume.show_label = false;
      };
    };

    customPalettes."Tokyo-Night" = {
      mError = "#f7768e";
      mHover = "#9ece6a";
      mOnError = "#16161e";
      mOnHover = "#16161e";
      mOnPrimary = "#16161e";
      mOnSecondary = "#16161e";
      mOnSurface = "#c0caf5";
      mOnSurfaceVariant = "#9aa5ce";
      mOnTertiary = "#16161e";
      mOutline = "#353d57";
      mPrimary = "#7aa2f7";
      mSecondary = "#bb9af7";
      mShadow = "#15161e";
      mSurface = "#1a1b26";
      mSurfaceVariant = "#24283b";
      mTertiary = "#9ece6a";
    };
  };
}
