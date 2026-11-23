## Luanti configuration for LAN gaming

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  luanti
  ];
}
