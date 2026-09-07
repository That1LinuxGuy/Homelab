## Luanti configuration for LAN gaming

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  luanti
  ];

  {
   services.minetest-server = {
     enable = true;
     port = 30000;
   };
  }
}
