{
  # Configure Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$modShift" = "$mod SHIFT";

      # Monitors
      monitor = [
        "HDMI-A-1,1920x1080@75,0x0,1"
        "eDP-1,disable"
      ];

      # General
      general = {
        gaps_in = 3;
        gaps_out = 8;

        border_size = 2;
        "col.active_border" = "rgb(8fbcbb)";
        "col.inactive_border" = "rgb(3b4252)";

        layout = "dwindle";
      };

      # Decoration
      decoration = {
        rounding = 3;
        blur = {
          enabled = true;
          size = 5;
          passes = 1;
          vibrancy = 0.1696;
        };
        shadow = {
          enabled = false;
        };
      };

      # Animations
      animations = {
        enabled = true;
        animation = [
          "global, 1, 3, default"
          "workspaces, 0, 3, default"
          "windowsIn, 1, 3, default, popin 87%"
          "windowsOut, 1, 3, default, popin 87%"
        ];
      };

      # Dwindle
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };

      # Misc
      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        disable_splash_rendering = true;
      };

      # Keybindings
      bind = [
        # Launch apps
        "$mod, B, exec, firefox"
        "$mod, Return, exec, foot"

        # Manage active window
        "$mod, Q, killactive,"

        # Switch to a workspace with $mod + num key
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"

        # Move active window to a workspace with $mod + shift + num key
        "$modShift, 1, movetoworkspacesilent, 1"
        "$modShift, 2, movetoworkspacesilent, 2"
        "$modShift, 3, movetoworkspacesilent, 3"
        "$modShift, 4, movetoworkspacesilent, 4"
        "$modShift, 5, movetoworkspacesilent, 5"
        "$modShift, 6, movetoworkspacesilent, 6"

        # Scroll through workspaces with $mod + , / .
        "$mod, Comma, workspace, e+1"
        "$mod, Period, workspace, e-1"
      ];
    };
  };
}
