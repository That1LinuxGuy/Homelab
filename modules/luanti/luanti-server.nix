## Luanti configuration for LAN gaming

{ config, pkgs, ... }:

{
  services.minetest-server = {
    enable = true;
    port = 30000;
    gameId = "minetest_game";
    config = {
      server_name = "Allen Family";
      max_users = 10;
      creative_mode = false;
      enable_damage = true;
      
      package = pkgs.minetest-server.override {
        extraGames = [
          pkgs.minetestgames.mineclonia
          pkgs.minetestgames.minetest_game
        ];
        extraMods = [
        # pkgs.minetestmods.mobs_monster
        ];
      };
    };
  };
}
