{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      margin-top = 0;
      margin-left = 0;
      margin-right = 0;
      height = 36;
      spacing = 8;

      modules-left = [ "clock" "niri/window" ];
      "niri/window" = {
        "max-length" = 20;
      };
      clock = {
        format = "{:%H:%M}";
      };

      modules-center = [ "niri/workspaces" ];
      
      modules-right = [ "wireplumber" "cpu" "memory" "battery" ];
      "cpu" = {
        "interval" = 5;
        "format" = "{usage}%";
      };
    }];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        border-radius: 0;
      }
      window#waybar {
        background-color: #829BBD;
        color: #829BBD;
      }
      #workspaces, #window, #clock, #wireplumber, #network, #cpu, #memory, #battery {
        background-color: rgba(30, 30, 46, 0.75);
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 4px;
        padding: 4px 12px;
      }

      #workspaces button,
      #workspaces button label {
        color: #829BBD;
        padding: 0 4px;
      }
      #workspaces button.active,
      #workspaces button.focused {
        color: #E5A8BA;
      }
    '';
  };
}
