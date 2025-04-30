{config, pkgs, ...}:
{
  programs.waybar.enable = true;
   
  programs.waybar.settings = {
  mainBar = {
    layer = "top";
    position = "top";
    height = 26;
    output = [
      "HDMI-A-1"
    ];

    modules-left = [ "custom/logo" "hyprland/workspaces" "sway/mode" ];
    modules-right = [ 
    "pulseaudio"
    "network"
    "temperature"
    "battery"
    "clock"
   ];
    
    "custom/logo" = {
      format = "";
      tooltip = false;
      on-click = ''bemenu-run --accept-single  -n -p "Launch" --hp 4 --hf "#ffffff" --sf "#ffffff" --tf "#ffffff" '';
    };

    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      persistent_workspaces = {
        "1" = []; 
        "2" = [];
        "3" = [];
        "4" = [];
      };
      disable-click = true;
    };

    "sway/mode" = {
      tooltip = false;
    };
    
    "sway/language" = {
      format = "{shortDescription}";
      tooltip = false;
      on-click = ''swaymsg input "1:1:AT_Translated_Set_2_keyboard" xkb_switch_layout next'';

    };

    "clock" = {
      interval = 60;
      format = "[TIME: {:%a %d/%m %I:%M}]";
    };

    "battery" = {
      tooltip = false;
    };


    "cpu"= {
      format= "[CPU: {usage}%]";
      tooltip= false;
    };

    "memory"= {
      format= "[MEMORY: {}%  ]";
    };

    "temperature" =
    {
      format = "[TEMPERATURE: {temperatureF}]";
    };

    "network" = 
    {
      format = "[WIRELESS INTERFACE: {ifname} -> {gwaddr}] [{ipaddr}/{cidr} -> SIGNAL STRENGTH: {signalStrength}%]";
    };

    "pulseaudio" = 
    {
      format = "[SOUND SERVER -> PULSEAUDIO; VOLUME: {volume}]";
      on-click = ''pavucontrol'';
    };
  };
  };

  programs.waybar.style = ''
  * {
    border: none;
    border-radius: 0;
    padding: 0;
    margin: 0;
    font-size: 14px;
  }

  window#waybar {
    background: #292828;
    color: #ffffff;
  }
  
  #custom-logo {
    font-size: 18px;
    margin: 0;
    margin-left: 7px;
    margin-right: 12px;
    padding: 0;
    font-family: NotoSans Nerd Font Mono;
  }
  
  #workspaces button {
    margin-right: 10px;
    color: #ffffff;
  }
  #workspaces button:hover, #workspaces button:active {
    background-color: #292828;
    color: #ffffff;
  }
  #workspaces button.focused {
    background-color: #383737;
  }

  #memory {
    margin-left: 7px;
    margin-right: 3px;
  }

  #pulseaudio {
    margin-left: 7px;
    margin-right: 3px;
  }

  #network {
    margin-left: 7px;
    margin-right: 3px;
  }
  #clock {
    margin-left: 7px;
    margin-right: 3px;
  }
  #cpu {
    margin-left: 7px;
    margin-right: 3px;
  }
  
  #language {
    margin-right: 7px;		
  }

  #battery {
    margin-left: 7px;
    margin-right: 3px;
  }
  '';
}
