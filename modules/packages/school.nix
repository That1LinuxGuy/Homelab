## List of child-friendly learning materials

{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    fastfetch
    brave
    libreoffice
    tuxpaint
    tuxtype
    gcompris
    kdePackages.ktuberling
    kdePackages.kblocks
    kdePackages.klettres
    kdePackages.skanpage
    zoom-us
  ];
}
