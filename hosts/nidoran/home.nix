{ pkgs, ... }:

{
  home.username = "mcallen";
  home.homeDirectory = "/home/mcallen";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    rofi 
    mako
    waybar
    swaybg
    openssh
  ];

  programs.home-manager.enable = true;
}
