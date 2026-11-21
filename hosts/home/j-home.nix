{ config, pkgs, inputs, ... }:

  # home manager config for james user
{
  imports = [ ];

  home.username = "james";
  home.homeDirectory = "/home/james";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    brave
    libreoffice
    tuxpaint
    tuxtype
    gcompris
    luanti
    kdePackages.ktuberling
    kdePackages.kblocks
    kdePackages.klettres
    zoom-us
  ];
}
