{ vars, ... }: {
  home.file.".config/wofi/power-menu.sh" = {
    executable = true;
    text = ''
    #!/usr/bin/env bash
    
    shutdown="Shutdown 襤"
    reboot="Restart ﰇ"
    suspend="Sleep 鈴"
    
    options="$suspend\n$reboot\n$shutdown"
    
    chosen="$(echo -e "$options" | wofi -d -p "Choose action: " -W 100 -H 200 -b -s $HOME/.config/wofi/pm-style.css)"
    
    case $chosen in
        $shutdown)
    	systemctl poweroff
        ;;
        $reboot)
            systemctl reboot
        ;;
        $suspend)
            systemctl suspend
        ;;
    esac
    '';
  };

  home.file.".config/wofi/pm-style.css".text = ''
  @define-color accent #cba6f7;
  @define-color txt #cad3f5;
  @define-color bg #24273a;
  @define-color bg2 #494d64;
  
  * {
      font-family: '${vars.terminal.font_name}', monospace;
      font-size: 14px;
  }

  entry {
    opacity: 0;
    margin: 0;
    padding: 0;
  }
  
  window {
      margin: 0px;
      padding: 10px;
      border: 3px solid @accent;
      border-radius: 7px;
      background-color: @bg;
  }
  
  #text {
      margin: 5px;
      padding: 10px;
      border: none;
      color: @txt;
  }
  '';
}
