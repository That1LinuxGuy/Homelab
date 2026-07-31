{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = null;

    settings = {
      window = {
        padding = { x = 10; y = 10; };
        opacity = 0.8;
      };
      font = {
        size = 11.0;
        normal = { family = "monospace"; };
      };
    };
  };
}
