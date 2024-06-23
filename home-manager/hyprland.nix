{ pkgs, vars, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''

    ${pkgs.waybar}/bin/waybar &

    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ~/Pictures/wallpaper.jpg &

    hyprctl setcursor macOS-BigSur 24

  '';

in {

    imports = [ ./keybinds.nix ];
  
    wayland.windowManager.hyprland = {

    enable = true;

    settings = {
      exec-once = "${startupScript}/bin/start";
      
      "plugin:borders-plus-plus" = {
        add_borders = 1; # 0 - 9

        # you can add up to 9 borders
        "col.border_1" = "rgb(7d17bd)";
        "col.border_2" = "rgb(e836f5)";

        # -1 means "default" as in the one defined in general:border_size
        border_size_1 = 10;
        border_size_2 = -1;

        # makes outer edges match rounding of the parent. Turn on / off to better understand. Default = on.
        natural_rounding = true;
      };

      #monitor = "eDP-1,1920x1080@60,0x0,1";
      monitor = [
        "DP-1,1920x1080@60,0x0,1.0"
        "eDP-1,1920x1080@60,280x1440,1.0"
      ];

      env = "XCURSOR_SIZE,24";
      
      input = {
          kb_layout = "us,ru";
          kb_variant = "";
          kb_model = "pc105";
          kb_options = "grp:win_space_toggle";
          kb_rules = "";
      
          follow_mouse = 1;
      
          touchpad = {
            disable_while_typing = 1;
            natural_scroll = 1;
            clickfinger_behavior = 0;
            middle_button_emulation = 1;
            tap-to-click = 1;
            drag_lock = 0;
          };
      };

      
      general = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          sensitivity = 1.0;
          apply_sens_to_raw = 1;
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          resize_on_border = true;

          "col.active_border" = "rgb(f5c2e7) rgb(eba0ac) rgb(f2cdcd) 45deg";
          "col.inactive_border" = "rgb(cba6f7)";
      
          layout = "dwindle";
      
          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn             this on
          allow_tearing = false;
      };

      decoration = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          rounding = 10;
          
          blur = {
              enabled = true;
              size = 3;
              passes = 1;
          };
      
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgb(b4befe)";
      };


      animations = {
          enabled = true;
      
          # Some default animations, see https://wiki.hyprland.org/Configuring/Animatons/ for more
      
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
      };

      dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # you probably want this
      };

      
      master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true;
      };


      gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = 1;
          workspace_swipe_fingers = 3;
          workspace_swipe_distance = 400;
          workspace_swipe_invert = 1;
          workspace_swipe_min_speed_to_force = 30;
          workspace_swipe_cancel_ratio = 0.5;
          workspace_swipe_create_new = 1;
          workspace_swipe_forever = 1;
      };

      misc = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      xwayland.force_zero_scaling = true; 
    };
  };
}
