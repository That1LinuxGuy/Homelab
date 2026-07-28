{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = null; # Use 'apk add waybar' binary

    settings = [{
      layer = "top";
      position = "top";
      margin-top = 8;
      margin-left = 12;
      margin-right = 12;
      height = 36;
      spacing = 8;

      modules-left = [ "niri/workspaces" "niri/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "wireplumber" "network" "battery" ];

      "niri/workspaces" = {
        format = "{icon}";
        };
      };

      clock = {
        format = "{:%H:%M}";
      };
    }];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        border-radius: 0;
      }
      window#waybar {
        background-color: transparent;
        color: #cdd6f4;
      }
      #workspaces, #window, #clock, #wireplumber, #network, #battery {
        background-color: rgba(30, 30, 46, 0.75);
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 12px;
        padding: 4px 12px;
      }
    '';
  };
