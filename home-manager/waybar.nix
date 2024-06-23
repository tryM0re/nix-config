{ ... }: {
  programs.waybar = {
    enable = true;

    settings = [{
       layer = "top";
       modules-left = ["custom/nixos" "hyprland/workspaces"];
       modules-center = ["clock"];
       modules-right = [
        "bluetooth"
        "network"
        "battery"
        "pulseaudio"
        "hyprland/language"
       ];
      "custom/nixos" = {
        format = "";
        tooltip = false;
        on-click = "sh $HOME/.config/wofi/power-menu.sh";
      };
      "hyprland/workspaces" = {
        format = "{icon}";
        tooltip = false;
        all-outputs = true;
        format-icons = {
          active = "";
          default = "";
        };
      };
      clock = {
        format = "<span color='#f5c2e7'> </span>{:%H:%M}";
      };
      pulseaudio = {
        format = "<span color='#f5c2e7'>{icon}</span> {volume}%";
        format-muted = "";
        tooltip = false;
        format-icons = {
          headphone = "";
          default = ["" "" "󰕾" "󰕾" "󰕾" "" "" ""];
        };
        scroll-step = 1;
      };
      bluetooth = {
        format = "<span color='#f5c2e7'></span> {status}";
        format-disabled = ""; 
        format-connected = "<span color='#f5c2e7'></span> {num_connections}";
        tooltip-format = "{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}   {device_address}";
        on-click = "blueman-manager";
      };
      network = {
        interface = "wlp3s0";
        format = "{ifname}";
        format-wifi = "<span color='#f5c2e7'> </span>{essid}";
        format-ethernet = "{ipaddr}/{cidr} ";
        format-disconnected = "<span color='#f5c2e7'>󰖪 </span>No Network";
        tooltip = false;
        on-click = "nm-connection-editor";
      };
      battery = {
        format = "<span color='#f5c2e7'>{icon}</span> {capacity}%";
        format-icons = ["" "" "" "" "" "" "" "" "" ""];
        format-charging = "<span color='#f5c2e7'></span> {capacity}%";
        tooltip = false;
      };
      "hyprland/language" = {
        format = "{short}";
      };
    }];

    style = ''
      * {
        border: none;
        font-family: 'Fira Code', 'Symbols Nerd Font Mono';
        font-size: 14px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 20px;
      }
      
      window#waybar {
        background: transparent;
      }
      
      #custom-nixos, #workspaces {
        border-radius: 10px;
        background-color: rgba(30,30,46,0.8);/*11111b;*/
        color: #f5c2e7; /*f5c2e7;*/
        margin-top: 15px;
        margin-right: 15px;
        padding-top: 1px;
        padding-left: 10px;
        padding-right: 10px;
      }
      
      #custom-nixos {
        font-size: 20px;
        margin-left: 15px;
        color: #f5c2e7;/*f5c2e7;*/
      }
      
      #workspaces button {
        background: rgba(30,30,46,0);/*11111b;*/
        color: #f5c2e7;/*f5c2e7;*/
      }
      
      #clock, #pulseaudio, #bluetooth, #network, #battery, #language {
        border-radius: 10px;
        background-color: rgba(30,30,46,0.8);/*11111b;*/
        color: #cdd6f4;/*cdd6f4;*/
        margin-top: 15px;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 15px;
      }
      
      #bluetooth {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-right: 5px;
        margin-right: 0
      }
      
      #network {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        padding-left: 5px;
      }
      
      #clock {
        margin-right: 0;
      }
    '';
  };
}
