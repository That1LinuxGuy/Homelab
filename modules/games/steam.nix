{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode = {
    enable = true;
    capSysNice = false;
  };

  users.users.mcallen.extraGroups = [ "gamemode" ];
}
