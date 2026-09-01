## List of helpful tools for laptops

{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    localsend
    converseen
  ];
}
