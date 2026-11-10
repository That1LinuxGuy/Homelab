{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; {
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;
}
