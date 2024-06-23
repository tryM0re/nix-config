{ vars, ... }: {

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      # apps
      "$mod, Return, exec, ${vars.terminal.name}"
      "$mod SHIFT, Return, exec, ${vars.terminal.name} -e ${vars.terminal.editor}"
      "$mod, s, exec, wofi"
      "$mod, Print, exec, grim ~/Pictures/Screenshots/Screenshot-region-$(date +'%Y-%m-%d-%H%M%S.png')"
      ", Print, exec, slurp | grim -g - - | swappy -f -"
      "$mod, M, exit"

      # sound & backlight control
      # TODO: replace F keys by X86
      ", F1, exec, volumectl toggle-mute"
      ", F2, exec, volumectl -u down"
      ", F3, exec, volumectl -u up"
      ", F4, exec, volumectl -m toggle-mute"
      ", F5, exec, lightctl down" 
      ", F6, exec, lightctl up" 

      # main
      "$mod, Q, killactive" 
      "$mod SHIFT, F, fullscreen"
      "$mod, F, togglefloating"
      "$mod ALT, F, exec, hyprctl dispatch workspaceopt allfloat"

      # group
      "$mod, G, togglegroup"
      "ALT, tab, changegroupactive"

      # move focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # toggle split
      "$mod, v, togglesplit"

      # move windows
      "$mod CTRL, left, movewindow, l"
      "$mod CTRL, right, movewindow, r"
      "$mod CTRL, up, movewindow, u"
      "$mod CTRL, down, movewindow, d"

      # workspaces
      "$mod, tab, workspace, m+1"
      "$mod SHIFT, tab, workspace, m-1"
      "$mod SHIFT, U, movetoworkspace, special"
      "$mod, U, togglespecialworkspace,"
      "$mod SHIFT, bracketleft, movetoworkspace, -1"
      "$mod SHIFT, bracketright, movetoworkspace, +1"
      "$mod CTRL, bracketleft, movetoworkspacesilent, -1"
      "$mod CTRL, bracketright, movetoworkspacesilent, +1"

      # 1..10 workspaces
    ] ++ (builtins.concatLists (builtins.genList
      (x:
        let
          ws =
            let c = builtins.div (x + 1) 10;
            in builtins.toString (x + 1 - (c * 10));
        in
        [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          "$mod CTRL, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
        ]) 10));

    # these KB will repeat on hold
    binde = [
      # resize windows
      "$mod SHIFT, left, resizeactive,-50 0"
      "$mod SHIFT, right, resizeactive,50 0"
      "$mod SHIFT, up, resizeactive,0 -50"
      "$mod SHIFT, down, resizeactive,0 50"
    ];

  };
}
