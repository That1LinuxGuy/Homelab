{ config, pkgs, inputs, ... }:

  # home manager config for charlotte user
{
  imports = [ ];

  home.username = "charlotte";
  home.homeDirectory = "/home/charlotte";
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
