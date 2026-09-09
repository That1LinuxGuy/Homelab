## Luanti configuration for LAN gaming

{ config, pkgs, ... }:

{
  services.minetest-server = {
    enable = true;
    port = 30000;
    gameId = "mineclonia";

    config = {
      server_name = "Allen Family";
      creative_mode = false;
      enable_damage = true;
    };
  };
}
