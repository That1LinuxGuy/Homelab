{ config, pkgs, inputs, ... }:

  # home manager config for shelby user
{
  imports = [
    desktop.nix
  ];

  home.username = "shelby";
  home.homeDirectory = "/home/shelby";
  home.stateVersion = "26.05";
}
