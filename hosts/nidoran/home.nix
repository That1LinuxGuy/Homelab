{ pkgs, ... }:

{
  home.username = "mcallen";
  home.homeDirectory = "/home/mcallen";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fuzzel
    mako
    waybar
    swaybg
  ];

  programs.home-manager.enable = true;
}
