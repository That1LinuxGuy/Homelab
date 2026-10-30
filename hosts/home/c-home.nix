{ config, pkgs, inputs, ... }:

  # home manager config for charlotte user
{
  imports = [
    ./desktop.nix
  ];

  home.username = "charlotte";
  home.homeDirectory = "/home/charlotte";
  home.stateVersion = "26.05";
}
